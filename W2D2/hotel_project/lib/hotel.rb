require_relative "room"

class Hotel
    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        @name.split(" ").map { |ele| ele.capitalize }.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.keys.include?(room_name)
            true
        else
            false
        end
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            print "sorry, room does not exist"
        elsif self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                print "check in successful"
            else
                print "sorry, room is full"
            end   
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0}
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name} #{room.available_space}"
        end
    end
end
