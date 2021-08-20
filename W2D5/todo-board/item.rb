class Item
    attr_reader :deadline
    attr_accessor :title, :description

    def self.valid_date?(date_string)
        date_strings = date_string.split("-").map(&:to_i)
        year = date_strings[0]
        month = date_strings[1]
        day = date_strings[2]

        year > 1000 && (0..12).member?(month) && (0..31).member?(day)
    end

    def initialize(title, deadline, description)

        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "Deadline is not a valid date"
        end

        @title = title
        @description = description
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "Deadline is not a valid date"
        end
    end
end

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false