require_relative 'piece'

class NullPiece < Piece
    include Singleton

    def initialize(color = nil, board, position)
        super
    end

    def moves
    end

    def symbol
        :_
    end
end