require_relative "board"
require_relative "human_player"

class Game

    attr_accessor :current_player
    attr_reader :board, :player_1_mark, :player_2_mark

    def initialize(player_1_mark, player_2_mark)
        @player_1_mark = HumanPlayer.new(player_1_mark)
        @player_2_mark = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1_mark
    end

    def switch_turn
        if @current_player == @player_1_mark
            @current_player = @player_2_mark
        else
            @current_player = @player_1_mark
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                p "Player #{@current_player.mark_value} wins!"
                return
            else
                self.switch_turn
            end
        end

        puts "There is a draw"
    end
end