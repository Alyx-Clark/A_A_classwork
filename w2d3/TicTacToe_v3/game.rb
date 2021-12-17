require_relative "board"
require_relative "human_player"
require_relative "computer_player"
class Game
    def initialize
        puts "Please enter a board size like 1 or 2"
        n = gets.chomp.to_i
        @board = Board.new(n)
        @players = []
        @players_marks = []
        puts "Please enter how many players there are like 2 or 3"
        num_players = gets.chomp.to_i
        raise "Thats not valid!" if num_players < 2 || !num_players.is_a?(Integer)
        (1..num_players).each do |i|
            puts "Player #{i} please enter your mark like X or O"
            player_mark = gets.chomp
            raise "Too many players have the same mark!" if @players_marks.include?(player_mark)
            @players_marks << player_mark
            puts "Player #{i} please enter either human or computer"
            type = gets.chomp
            if type == "human"
                @players << HumanPlayer.new(player_mark)
            else
                @players << ComputerPlayer.new(player_mark)
            end
        end
        @current_player = @players.first
    end

    def switch_turn
        @players.rotate!
        @current_player = @players.first
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position(@board.legal_positions)
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "You freakin did it player #{@current_player.mark}. You won!"
                return
            else 
                self.switch_turn
            end
        end
    end
end