require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(instance)
        puts "number of exact matches: #{@secret_code.num_exact_matches(instance)}"
        puts "number of near matches: #{@secret_code.num_near_matches(instance)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        response = gets.chomp # gives me back string
        print_matches(Code.from_string(response)) 
        @secret_code == Code.from_string(response)
    end
end
