

class HumanPlayer

    attr_reader :mark

    def initialize(mark)

        @mark = mark

    end

    def get_position(mark, positions)

        print "\n Player ", mark, " enter a position with `row col` separated with a space like `4 7`\n"
        input = gets.chomp.split(' ').map(&:to_i)
        if positions.include?(input)
            print "\n Player ", mark, "\nyour target is: #{input}\n"
            return input  
        else
            print "\n Try again. Not a valid position. \n"
            get_position(mark, positions)
        end
        
    end





end