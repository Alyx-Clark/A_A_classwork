require_relative "passenger"
require "byebug"
# attr_reader :passengers
class Flight
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        if @passengers.length >= @capacity
            return true
        else
            false
        end
    end

    def board_passenger(passenger)
        # debugger
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end
    end



    def list_passengers
        new_arry = []
        @passengers.each do |ele|
            new_arry << ele.name
        end
        new_arry
    end

    def [](number)
        @passengers[number]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end