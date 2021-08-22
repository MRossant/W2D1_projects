require 'byebug'

class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)} # creates unique subarrays
        @size = n * n
    end
 
    def [](position) # getter for position on board
        row, col = position
        @grid[row][col]
    end

    def []=(position, value) # setter for position on board
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count {|el| el == :S} # flattens 2D grid into 1D array and counts el if el == :S
    end

    def attack(position) # checks if position is == :S
        if self[position] == :S
            self[position] = :H # sets position to :H if true
            p "you sunk my battleship!"
            true
        else
            self[position] = :X # sets position to :X if false
            false
        end
    end

    def place_random_ships
        smaller_board = @size * 0.25

        while self.num_ships < smaller_board # loops until num of ships is == smaller board size
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            pos = [rand_row, rand_col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row| # looping thru each row in GRID
            row.map do |el| # looping thru each el in ROW
                if el == :S # checks to see if el == :S
                    el = :N # sets el to :N
                else
                    el # returns original el into new 2D array
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        hidden_grid = self.hidden_ships_grid
        Board.print_grid(hidden_grid)
    end
end
