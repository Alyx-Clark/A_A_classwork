# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        has_nums = self.all? { |ele| ele.is_a? Integer }
        if has_nums 
            difference = self.max - self.min
        end
    end

    def average
        return nil if self.empty?
        has_nums = self.all? { |ele| ele.is_a? Integer }
        if has_nums
            average = (self.sum*1.0)/(self.length*1.0)
        end
    end

    def median
        return nil if self.empty?
        if self.length.odd?
            idx = (length/2).floor
            sorted = self.sort
            return sorted[idx]
        end
        if self.length.even?
            idx = (length/2)
            sorted = self.sort
            average = (sorted[idx] + sorted[idx-1.0])/2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1
        end
        hash
    end

    def my_count(ele)
        count = 0
        self.each do |char|
            count += 1 if char == ele
        end
        count
    end

    def my_index(ele)
        self.each_with_index do |char,idx|
            return idx if char == ele
        end
        nil
    end

    def my_uniq
        hash = {}
        self.each {|ele| hash[ele] = 0}
        hash.keys
    end

    def my_transpose
        new_arry = []
        self.each_with_index do |ele1,idx1|
            row = []
            self.each_with_index do |ele2,idx2|
                row << self[idx2][idx1]
            end
            new_arry << row
        end
        new_arry
    end

end
