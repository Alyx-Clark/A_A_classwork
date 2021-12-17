require "byebug"
class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        # debugger
        nums = ("0".."100").to_a
        puts "Your mark is #{@mark}"
        arr = "a"
        while !legal_positions.include?(arr)
            puts "Please enter a VALID position like this '4,3'"
            position = gets.chomp
            arr = position.split(",")
            arr.map!{|ele| ele.to_i}
        end
        # raise "Incorrect format" if arr.length != 2 || !nums.include?(arr[0]) || !nums.include?(arr[1])
        # arr.map!{|ele| ele.to_i}
        arr
    end

end