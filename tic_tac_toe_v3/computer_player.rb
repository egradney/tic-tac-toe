
class ComputerPlayer

    attr_reader :mark

    def initialize(mark)

        @mark = mark

    end


    def get_position(mark, positions)
        
        input = positions[rand(positions.length)]
        print "\n Player ", mark, "\nyour target is: #{input}\n"
        input

    end
end