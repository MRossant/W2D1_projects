require_relative "room"

class Hotel

    attr_reader :rooms

  def initialize(name, hash)
    @rooms = hash.transform_values {|v| Room.new(v)}
    @name = name
  end

  def name
    new_name = []
    @name.split(" ").each {|str| new_name << str.capitalize}
    new_name.join(" ")
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if !room_exists?(room_name)
        puts "sorry, room does not exist"
    elsif room_exists?(room_name) && @rooms[room_name].add_occupant(person)
        puts "check in successful"
    else
        puts "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.values.any? {|room| !room.full?}
  end

  def list_rooms
    @rooms.each {|name, room| puts "#{name} : #{room.available_space}"}
  end
end
