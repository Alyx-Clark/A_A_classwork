require "byebug"
class Board
    def initialize(n)
        @n = n
        @grid = Array.new(n){ Array.new(n, :N)}
        @size = @n * @n
    end

    def size
        @size
    end

    def [](array)
        @grid[array[0]][array[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    #Part 2

    def attack(position)
        if self.[](position) == :S
            # debugger
            self.[]=(position, :H)
            puts "you sunk my battleship!"
            # debugger
            true
        else
            # debugger
            self.[]=(position, :X)
            false
        end
    end

    def place_random_ships
        quarter = (@size * 0.25).to_f.ceil
        while self.num_ships < quarter
            num1 = rand(0...@n)
            num2 = rand(0...@n)
            position = [num1,num2]
            self.[]=(position, :S)
        end
    end

    def hidden_ships_grid
        # debugger
        @grid.map do |arry|
            arry.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |arry|
            puts arry.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
