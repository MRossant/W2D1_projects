class GuessingGame
    attr_reader :num_attempts
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            @game_over = true
            p "You win !! 🎉"
            puts "*****************"
        elsif num > @secret_num
            p "Too big mate 😬"
            puts "*****************"
        else
            p "Too small 😭"
            puts "*****************"
        end
    end
    
    def ask_user
        p "enter a number"
        response = gets.chomp.to_i
        checked_num = check_num(response)
    end
end
