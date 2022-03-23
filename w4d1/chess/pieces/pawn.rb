require_relative 'piece'

class Pawn < Piece
    def symbol
        "♙".colorize(color)
    end

    def moves
        moves_result = []
        moves_result << forward_steps if self.board[forward_steps].is_a?(NullPiece)
        side_attacks.each do |array|
            moves_result << array if self.board.valid_pos?(array) && 
                self.board[array].color != self.color && 
                !self.board[array].color.nil?
        end

        moves_result
    end

    private # whitye will start in row 6 and black in row 1
    def at_start_row? # returns true if row 1 && color is black or row 6 and color is white
        return true if (self.color == 'B' && self.pos[0] == 1) ||
            (self.color == 'W' && self.pos[0] == 6)
        false
    end

    def forward_dir # return 1 or -1 one color gets 1 other color gets -1
        self.color == 'W' ? -1 : 1
    end

    def forward_steps
        # checks if at start_row, if true, allowed to move forward_dir X 2
        # forward_dir 1 time
        cur_x, cur_y = self.pos
        new_x = cur_x + forward_dir
        new_pos = [new_x, cur_y] 
    end

    def side_attacks # [[1, -1] , [1, 1]] || [[-1, -1], [-1, 1]]
        side_moves = []
        cur_x, cur_y = self.pos # [ 1, 2]
        new_x = cur_x + forward_dir # 2
        [1,-1].each do |dy|
            new_y = cur_y + dy
            side_moves << [new_x, new_y]
        end
        side_moves
    end
end