class ComputerPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        num = rand(1...legal_positions.length)
        v = legal_positions[num]
        puts "Computer #{@mark} chose position #{v}"
        v
    end
end