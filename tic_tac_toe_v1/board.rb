require "byebug"
require_relative "game"


class Board

    attr_reader :grid

    def initialize(n)

    @grid = Array.new(n) { Array.new(n, "'_'") }
    @length = n
    @size = n * n

    end

    def valid?(pos)

        row, col = pos

        if col < @length && row < @length
            return true
        end

        false

        rescue
            return false

    end

    def empty?(pos)
        row, col = pos

        if @grid[row][col] == "'_'"
            return true
        end

        false

        rescue
            return false

    end

    def place_mark(pos, mark)

        if self.valid?(pos)
            if self.empty?(pos)
                row, col = pos
                @grid[row][col] = mark
                return true
            end

        end

        false

        rescue
            return false

    end

    def print
        
        @grid.each_with_index { |row, i| puts "\n#{i} #{row.join(' ')}\n" }
  
    end

    def win_row?(mark)

        @grid.any? { |row| row.all? { |ele| ele == mark } }

    end


    def win_col?(mark)

        @grid.transpose.any? { |col| col.all? { |ele| ele == mark } }

    end

    def win_diagonal?(mark)

        @grid.all? { |row| row[@grid.index(row)] == mark} ||
        @grid.all? { |row| row[ ((@grid.index(row)-(row.length-1))) * -1] == mark}


    end

    def win?(mark)

        self.win_row?(mark) || 
        self.win_col?(mark) || 
        self.win_diagonal?(mark)

    end


    def empty_positions?

        @grid.each do |row|
            row.each do |ele|
                if ele == "'_'"
                    return true
                end
            end
        end

        false

    end

end