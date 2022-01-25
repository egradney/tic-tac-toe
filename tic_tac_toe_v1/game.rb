require_relative "board"
require_relative "human_player"


class Game

    attr_reader :board, :player1, :player2, :current_player

    attr_writer :current_player

    def initialize(n, player_1_mark, player_2_mark)

        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @board = Board.new(n)
        @current_player = @player1
        @n = n

    end

    def switch_turn
        if current_player == @player1
            self.current_player= @player2 
        else
            self.current_player= @player1
        end

    end

    def play

        puts 'Welcome to Tic-Tac-Toe!'
  
        while @board.empty_positions?

            @board.print

            if @board.place_mark(@current_player.get_position, @current_player.mark)
                if @board.win?(@current_player.mark)
                    @board.print
                    print  "Victory! ", @current_player.mark, " wins! \n"
                    @board= Board.new(@n)
                    self.play
                end
                    self.switch_turn
            else
                @current_player.get_position
            end

       
            
        end

        print "No more moves available. Game ends in a DRAW.\n"
        @board= Board.new(@n)
        @current_player = @player1
        self.play

        rescue NoMethodError
            print "Try again. Please enter a valid position \n"
            @current_player.get_position

    end


end