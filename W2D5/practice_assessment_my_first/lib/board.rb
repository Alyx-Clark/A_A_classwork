class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(stacks)
        Array.new(stacks){Array.new()}
    end

    def initialize(stacks, max_height)
        raise "rows and cols must be >= 4" if stacks < 4 || max_height < 4
        @max_height = max_height
        @stacks = Board.build_stacks(stacks)
    end

    def max_height
        @max_height
    end

    def add(token, stack_index)
        if @stacks[stack_index].length < @max_height
            @stacks[stack_index] << token
            return true
        else
            false
        end
    end

    def vertical_winner?(token)
        @stacks.each do |column|
            return true if column.all? {|ele| ele == token} && column.length == @max_height
        end
        false
    end

    def horizontal_winner?(token)
        (0...@stacks.min.length).each do |i|
            arry = []
            @stacks.each do |ele|
                arry << ele[i]
            end
            return true if arry.all? {|tok| tok == token }
        end
        false
    end

    def winner?(token)
        self.vertical_winner?(token) || self.horizontal_winner?(token)
    end

end
