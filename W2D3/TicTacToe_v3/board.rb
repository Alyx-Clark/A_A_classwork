require "byebug"
class Board
    attr_reader :n
    def initialize(n)
        @n = n
        @grid = Array.new(n){Array.new(n,"_")}
    end

    def valid?(position)
        return false if position[0] > @n-1 || position[0] < 0
        return false if position[1] > @n-1 || position[1] < 0
        true
    end

    def empty?(position)
        @grid[position[0]][position[1]] == "_"
    end

    def place_mark(position, mark)
        # debugger
        if self.valid?(position) && self.empty?(position)
            @grid[position[0]][position[1]] = mark
        else
            raise "That position is invalid! Games over for you tring to cheat!"
        end
    end

    def print
        @grid.each do |arry|
            puts arry.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |arry|
            if arry.all? {|ele| ele == mark}
                return true
            end
        end
        false
    end

    def win_col?(mark)
        (0...@grid.length).each do |i|
            arry = []
            @grid.each do |row|
                arry << row[i]
            end
            return true if arry.all? {|ele| ele == mark}
        end
        false
    end

    def win_diagonal?(mark)
        cross_1 = []
        cross_2 = []
        (0...@grid.length).each do |i|
            cross_1 << @grid[i][i]
            cross_2 << @grid[i][@grid.length - 1 - i]
        end
        return true if cross_1.all?{|ele| ele == mark} || cross_2.all?{|ele| ele == mark}
        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |arry|
            arry.each do |ele|
                return true if ele == "_"
            end
        end
        false
    end

    def legal_positions
        valid_positions = []
        (0...@grid.length).each do |idx1|
            (0..@grid.length).each do |idx2|
                valid_positions << [idx1, idx2] if self.empty?([idx1, idx2])
            end
        end
        valid_positions
    end
end

if __FILE__ == $PROGRAM_NAME


# b = Board.new

# b.place_mark([-1, 2], :X) # this should fail

# b.place_mark([1, 2], :X)


# b.place_mark([1, 3], :X) # this should fail

# b.place_mark([0, 0], :O)

# # <Board:0x @grid=[[:O, "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

# b.place_mark([0, 0], :X) # this should fail

end