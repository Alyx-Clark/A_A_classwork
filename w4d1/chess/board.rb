require_relative "piece"
class Board
    def initialize
        @rows = Array.new(8) { Array.new(8, nil) }
        set_up_board
    end



    def set_up_board
        [0, 1, 6, 7].each do |row|
            (0..7).each do |col|
                self[[row, col]] = Piece.new("W", self, [row, col])
            end
        end
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, value)
        row, col = pos
        @rows[row][col] = value
    end

    def move_piece(start_pos, end_pos)
        raise if self[start_pos] == nil
        raise if !valid_pos?(end_pos)

        current_piece = self[start_pos]
        self[start_pos] = nil
        self[end_pos] = current_piece
        current_piece.pos = end_pos
        
    end 

    def valid_pos?(pos)
        return true if self[pos] == nil && 
            pos.all? { |n| n < 8 && n > -1 }
        false
    end

    private

end