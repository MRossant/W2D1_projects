class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        puts "Player #{@mark_value}, enter two numbers representing a position in the format `row col`"
        response = gets.chomp
        raise "incorrect response" if response.split(" ").length != 2
        nums = response.split(" ").map(&:to_i)
        row, col = nums
        [row, col]
    end
end