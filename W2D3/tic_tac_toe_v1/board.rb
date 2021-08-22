require 'byebug'

class Board

    attr_reader :grid

    def initialize
        @grid = Array.new(3) { Array.new(3, "_") }
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def valid?(position)
        row, col = position
        (0...3).to_a.include?(row) && (0...3).to_a.include?(col)
    end

    def empty?(position)
        self[position] == "_"
    end

    def place_mark(position, mark)
        if self.valid?(position) && self.empty?(position)
            self[position] = mark
        else
            raise "invalid mark"
        end
    end

    def print
        @grid.each do |row|
            puts
            p row
            puts
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all?(mark)
        end

        false
    end

    def win_col?(mark)
        @grid.transpose.each do |row|
            return true if row.all?(mark)
        end

        false
    end

    def win_diagonal?(mark)
        left_to_right = (0...@grid.length).all? do |i|
            pos = [i, i]
            self[pos] == mark
        end

        right_to_left = (0...@grid.length).all? do |i|
            row = i
            col = @grid.length - 1 - i
            pos = [row, col]
            self[pos] == mark
        end

        left_to_right || right_to_left
    end

    # def win_left_diagonal(mark)
    #     (0...@grid.length).all? do |i|
    #         @grid[i][i] == mark
    #     end
    #     # @grid[0][0] == @grid[1][1] == @grid[2][2]
    # end

    # def win_right_diagonal(mark)
    #     @grid.transpose.reverse.all? do |i|
    #         @grid[i][i] == mark
    #     end
    # end

    def win?(mark)
        self.win_diagonal?(mark) || self.win_row?(mark) || self.win_col?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |el|
                return true if el == "_"
            end
        end

        false
    end

end