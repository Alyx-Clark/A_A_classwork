require 'colorize'

class Piece
    attr_accessor :pos
    attr_reader :color, :board
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def inspect
        # "#{@color}, #{@pos}"
        "#{symbol}"
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