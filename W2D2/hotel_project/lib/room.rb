class Room
    attr_reader :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        if @occupants.length < @capacity
            return false
        elsif @occupants.length == @capacity
            return true
        end
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(guest_name)
        if !self.full?
            @occupants << guest_name
            return true
        else
            return false
        end
    end
end
