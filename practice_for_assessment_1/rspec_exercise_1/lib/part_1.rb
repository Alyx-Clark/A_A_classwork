def average(num_1, num_2)
    average = (num_1 + num_2)/2.0
end

def average_array(arry)
    sum = arry.sum * 1.0
    length = arry.length * 1.0
    average = sum/length
end

def repeat(str, num)
    str*num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arry = str.split(" ")
    arry.map!.with_index do |word,idx|
        if idx.even? 
            word.upcase
        else
            word.downcase
        end
    end
    arry.join(" ")
end