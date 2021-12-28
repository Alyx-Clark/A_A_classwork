require_relative 'piece'
require_relative 'stepable'
class King < Piece
    include Stepable
    def symbol
        "♚".colorize(color)
    end

    protected
    def move_diffs
        [
            [-1, -1], [-1,  1],
            [-1, -1], [-1,  1],
            [ 1, -1], [ 1,  1],
            [ 1, -1], [ 1,  1]
        ].freeze
    end
end