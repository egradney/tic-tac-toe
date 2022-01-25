require_relative "board_v3"
require_relative "human_player_v3"
require_relative "computer_player"


class Game

    attr_reader :board, :players, :current_player

    attr_writer :current_player

    def initialize(board_length, player_1_mark, player_2_mark)

        @players = [ HumanPlayer.new(player_1_mark), ComputerPlayer.new(player_2_mark) ]
        @board = Board.new(board_length)
        @current_player = @players[0] 
        @board_size = board_length

    end

    def switch_turn

        if current_player == @players[0]
            self.current_player= @players[1]
        else
            self.current_player= @players[0]
        end
      
    end

    def play
  
        while @board.empty_positions?

            @board.print
    
            if @board.place_mark(@current_player.get_position(@current_player.mark, @board.legal_positions), @current_player.mark)
                if @board.win?(@current_player.mark)
                    @board.print
                    print  "Victory! ", @current_player.mark, " wins! \n"
                    @board= Board.new(@board_size)
                    self.play
                end
                    self.switch_turn
            else
                print "Try again. Please enter a valid position \n"
                self.play
            end
            
        end

        print "No more moves available. Game ends in a DRAW.\n"
        @board= Board.new(@board_size)
        @current_player = @player1
        self.play

        # rescue
        #     print "Try again. Please enter a valid position \n"
        #     @current_player.get_position

    end


end