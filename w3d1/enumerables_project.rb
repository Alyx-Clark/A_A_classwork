class Array
    def my_each(&prc) 
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
    end

    def my_select(&prc)
        output = []
        self.my_each{|ele| output << ele if prc.call(ele)}# do |ele|
            # if prc.call(ele) == true
            #     output << ele
            # end
        # end
        output
    end

    def my_reject(&prc)
        self.select { |ele| !prc.call(ele) }
    end

    def my_any?(&prc)
        self.any? { |ele| prc.call(ele) }
    end

    def my_all?(&prc)
        self.all? { |ele| prc.call(ele) }
    end

    def my_flatten
        output = []
        self.each do |ele|
            if !ele.is_a?(Array)
                output << ele
            else
                output += ele.my_flatten
            end
        end
        output
    end

    # def my_zip(*arg)
    #     output = Array.new(self.length) {Array.new(arg.length+1, nil)}
    #     (0...self.length).each do |idx|
    #         (0...arg.length+1).each do |idx_2|
    #             output[idx][idx_2] = self[idx]
    #         end
    #     end
    # end

    def my_zip(*arg)
        new_arry = []
        (0...self.length).each do |i|
            arry = []
            arry << self[i]
            arg.each do |sub_arry|
                arry << sub_arry[i]
            end
            new_arry << arry
        end
        new_arry
    end

    def my_rotate(num=1)
        self.rotate(num)
    end

    def my_join(str="")
        new_str = ""
        self.each do |char|
            new_str += char + str
        end
        new_str.delete!(new_str[-1]) if new_str.length > self.length
        new_str
    end

end
