class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(num_stacks)
        Array.new(num_stacks) {Array.new()}
    end

    def initialize(num_stacks, max_height)
        raise "rows and cols must be >= 4" if num_stacks < 4 || max_height < 4
        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)
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
        @stacks.any? { |stack| stack.all?(token) && stack.length == @max_height }
    end

    def horizontal_winner?(token)
        (0...@stacks.min.length).each do |i|
            arry = []
            @stacks.each do |stack|
                arry << stack[i]
            end
            return true if arry.all? { |ele| ele == token}
        end
        false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end
end
