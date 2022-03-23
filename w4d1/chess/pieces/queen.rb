require_relative 'piece'
require_relative "slideable"
class Queen < Piece
    include Slideable

    def symbol
        "♛".colorize(color)
    end

    private
    def move_dirs
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end
end