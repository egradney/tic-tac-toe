

class HumanPlayer

    attr_reader :mark

    def initialize(mark)

        @mark = mark

    end

    def get_position
        print "enter a position with coordinates separated with a space like `4 7`\n"
        input = gets.chomp.split(' ').map(&:to_i)
        print "\nyour target: #{input}\n"
        input
    end





end