require "byebug"
# require_relative


class Board

    attr_reader :grid

    def initialize(length)

    @grid = Array.new(length) { Array.new(length, "'_'") }
    @length = length
    @size = length * length

    end

    def valid?(position)
        
        pos = position.split(' ').map { |ele| ele.to_i}
        row, col = pos
        if row > @length ||  col > @length
            return false
        end

        true

    end

    def empty?(position)
        pos = position.split(' ').map { |ele| ele.to_i}
    
        row, col = pos
    
        if row > @length || col > @length
            return false
        end
        @grid[row][col] == "'_'"

    end

    def place_mark(position, mark)

        if !self.valid?(position) or !self.empty?(position)
            raise error
        else
            pos = position.split(' ').map { |ele| ele.to_i}
            row, col = pos
            @grid[row][col] = mark
            return true
        end


    end


    # def win?

    # end

    # def game_over?



end

brd = Board.new(5)
p brd.valid?('0 6')  #=> false
p brd.valid?('8 8') #=> false
p brd.valid?('2 2')  #=> true
p brd.empty?('3 3') #=> true
p brd.place_mark('3 3', :X) #=> true
p brd.empty?('3 3')          #=> false                 