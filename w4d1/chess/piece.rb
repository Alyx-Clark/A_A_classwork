require_relative "board"
class Piece
    attr_reader :color
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def inspect
        "Color: #{@color}, Position: #{@pos}"
    end

    def to_s

    end

    def empty?

    end

    def valid_moves
        valids = []
        valids
    end

    def pos=(value)
        @pos = value
    end

    def symbol
        
    end


    private
    def move_into_check?(end_pos)
        
    end
end