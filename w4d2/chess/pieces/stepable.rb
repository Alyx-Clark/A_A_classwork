module Stepable
    def moves
        moves_result = []
        cur_x, cur_y = self.pos
        move_diffs.each do |(dx, dy)|
            new_pos = [cur_x + dx, cur_y + dy]
            if self.board.valid_pos?(new_pos) && 
                self.board[new_pos].color != self.color
                moves_result << new_pos
            end
        end
        moves_result
    end

    private
    def move_diffs

    end
end