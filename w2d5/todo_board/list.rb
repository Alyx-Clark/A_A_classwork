require_relative "item"
class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description = "")
            return true
        else
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index > -1 && index < self.size 
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
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
        puts "-----------------------------------------------------"
        puts "                   #{@label}                           "
        puts "-----------------------------------------------------"
        puts"Index    | Item                          |  Deadline"
        puts "-----------------------------------------------------"
        @items.each_with_index do |ele,idx|
            puts "#{idx}        | #{ele.title}                    | #{ele.deadline}"
        end
        puts "------------------------------------------------------"
    end

    def print_full_item(index)
        if self.valid_index?(index)
            puts "---------------------------------------------------"
            puts "#{@item[index].title}          #{@item[index].deadline}"
            puts @item[index].description
            puts "---------------------------------------------------"
        end
    end

    def print_priority
        puts @item[0]
    end

    def up(index, amount = 1)
        if self.valid_index?(index)
            (1..amount).each do |i|
                self.swap(index, index-1)
            end
            true
        else
            false
        end
    end

    def down(index, amount = 1)
        if self.valid_index?(index)
            (1..amount).each do |i|
                self.swap(index, index+1)
            end
            true
        else
            false
        end
    end

    def sort_by_date!
        
    end

end

if __FILE__ == $PROGRAM_NAME
    # p my_list = List.new('Groceries')
    # p my_list.size
    # p my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
    # p my_list.add_item('toothpaste', '2019-10-25')
    # p my_list.add_item('shampoo', '10-24-2019')
    # p my_list.add_item('shampoo', '2019-10-24')
    # p my_list.add_item('candy', '2019-10-31', '4 bags should be enough')
    # p my_list
    # p my_list.size
    # p my_list.swap(0,  2)
    # p my_list.priority
    # p my_list
    # p my_list.swap(1,  7)
    # p my_list[3]
    # p my_list.swap(1,  3)
    # p my_list[1]
    # p my_list[3]

    l = List.new('Groceries')
    l.add_item('cheese', '2019-10-25')
    l.add_item('toothpaste', '2019-10-25')
    l.add_item('shampoo', '2019-10-24')
    l.add_item('candy', '2019-10-31')
    l.print
    l.down(0)
    l.print
    l.down(0, 2)
    l.print
end
