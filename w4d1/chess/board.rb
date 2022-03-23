require_relative 'relatives'

class Board
    def initialize
        @rows = Array.new(8) { Array.new(8) { NullPiece.instance }}

        [0, 1, 6, 7].each do |row|
            case row
            when 0
                (0..7).each do |col|
                    pos = [row, col]
                    case col
                    when 0 # put a rook
                        self[pos] = Rook.new(:black, self, pos)
                    when 7 # put a rook
                        self[pos] = Rook.new(:black, self, pos)
                    when 1 # put a knight
                        self[pos] = Knight.new(:black, self, pos)
                    when 6 # put a knight
                        self[pos] = Knight.new(:black, self, pos)
                    when 2 # put a bishop
                        self[pos] = Bishop.new(:black, self, pos)
                    when 5 # put a bishop
                        self[pos] = Bishop.new(:black, self, pos)
                    when 3 # put a queen
                        self[pos] = Queen.new(:black, self, pos)
                    when 4 # put a king
                        self[pos] = King.new(:black, self, pos)
                    end
                end
            when 7
                (0..7).each do |col|
                    pos = [row, col]
                    case col
                    when 0 # put a rook
                        self[pos] = Rook.new(:white, self, pos)
                    when 7 # put a rook
                        self[pos] = Rook.new(:white, self, pos)
                    when 1 # put a knight
                        self[pos] = Knight.new(:white, self, pos)
                    when 6 # put a knight
                        self[pos] = Knight.new(:white, self, pos)
                    when 2 # put a bishop
                        self[pos] = Bishop.new(:white, self, pos)
                    when 5 # put a bishop
                        self[pos] = Bishop.new(:white, self, pos)
                    when 3 # put a queen
                        self[pos] = Queen.new(:white, self, pos)
                    when 4 # put a king
                        self[pos] = King.new(:white, self, pos)
                    end
                end
            when 1
                (0..7).each do |col|
                    pos = [1, col]
                    self[pos] = Pawn.new(:black, self, pos)
                end
            when 6
                (0..7).each do |col|
                    pos = [6, col]
                    self[pos] = Pawn.new(:white, self, pos)
                end
            end
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @rows[row][col] = value
    end

    def move_piece(start_pos, end_pos)
        raise if self[start_pos].is_a? (NullPiece)
        raise if !valid_pos?(end_pos)
        raise if !self[start_pos].moves.include?(end_pos)

        current_piece = self[start_pos]
        self[start_pos] = NullPiece.instance
        self[end_pos] = current_piece
        current_piece.pos = end_pos
        
    end 

    def valid_pos?(pos)
        # valid pos if the pos is a null piece & in bound
        pos.all? { |n| n < 8 && n > -1 }
    end

    private

end