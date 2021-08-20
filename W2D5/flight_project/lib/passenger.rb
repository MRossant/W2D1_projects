class Passenger
    attr_reader :name, :flight_numbers
    
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

end