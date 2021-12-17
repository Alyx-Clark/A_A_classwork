class Item 
    attr_accessor :title, :description
    attr_reader :deadline
    def self.valid_date?(date_string)
        arry = date_string.split("-")
        arry.map! { |ele| ele.to_i }
        print arry
        return false if arry.length != 3
        return false if arry[1] > 12 || arry[1] < 1
        return false if arry[2] > 31 || arry[2] < 1
        true
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "That date is not valid"
        end  
        @description = description
    end

    def deadline=(deadline)
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "That date is not valid"
        end    
    end
end