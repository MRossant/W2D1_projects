require_relative 'item.rb'

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, *description)
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        @items[index] != nil
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        else
            false
        end
    end

    def [](index)
        if self.valid_index?(index)
            @items[index]
        else
            nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts
        puts "- - - - - - - - - - - - - - - - - - - - - - - - - - -"
        puts
        puts "                   #{@label.upcase}                  "
        puts
        puts "- - - - - - - - - - - - - - - - - - - - - - - - - - -"
        puts
        puts "Index | Item                               | Deadline"
        puts 
        puts "- - - - - - - - - - - - - - - - - - - - - - - - - - -"
        puts
        @items.each.with_index do |item, i|
            puts "#{i}  | #{item.title}              | #{item.deadline}"
        end
        puts "- - - - - - - - - - - - - - - - - - - - - - - - - - -"
    end

    def print_full_item(index)
        if self.valid_index?(index)
            puts "- - - - - - - - - - - - - - - - - - - - - - - - - - -"
            puts
            puts "#{@items[index].title}                     #{@items[index].deadline}"
            puts "#{@items[index].description}"
            puts 
            puts "- - - - - - - - - - - - - - - - - - - - - - - - - - -"
        else
            nil
        end
    end

    def print_priority
        if self.valid_index?(0)
            puts "- - - - - - - - - - - - - - - - - - - - - - - - - - -"
            puts
            puts "#{@items[0].title}                     #{@items[0].deadline}"
            puts "#{@items[0].description}"
            puts 
            puts "- - - - - - - - - - - - - - - - - - - - - - - - - - -"
        else
            nil
        end
    end

    def up(index, amount)

        return false if !self.valid_index?(index)
        amount.times do |i|
            previous = index - 1
            if previous != -1
                self.swap(index, previous)
                index -= 1
            end
        end
        true
    end
end