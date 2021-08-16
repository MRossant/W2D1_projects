# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self == []
            return nil
        else
            return self.max - self.min
        end
    end

    def average
        if self == []
            return nil
        else
            return (self.sum * 1.0) / self.length
        end
    end

    def median
        sorted = self.sort
        length = self.length
        if sorted == []
            return nil
        elsif sorted.length.odd?
            return sorted[length / 2]
        else
            return (sorted[(length / 2) - 1] + sorted[length / 2]) / 2.0
        end
    end

    def counts
        hash = Hash.new(0)

        self.each do |ele|
            hash[ele] += 1
        end

        hash
    end

    def my_count(val)
        count = 0
        self.each {|el| count += 1 if el == val}
        count
    end

    def my_index(val)
        return nil if !self.include?(val)
        self.each.with_index {|el, i| return i if el == val}
    end

    def my_uniq
        uniq = []
        self.each.with_index do |el, i|
            uniq << el if !uniq.include?(el)
        end

        uniq
    end

    def my_transpose
        #  arr_1 = [
        #   ["a", "b", "c"],
        #   ["d", "e", "f"],
        #   ["g", "h", "i"]
        # ]
        result = []

        (0...self[0].length).to_a.each do |i| # [0, 1, 2]
            combined = [] # [a, d, g]
            self.each.with_index do |sub_arr, arr_idx|
                combined << sub_arr[i] # sub_arr[2]
            end

            result << combined
        end

        result
    end

end
