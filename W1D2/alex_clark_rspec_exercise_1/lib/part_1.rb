def average(num_1, num_2)
    return (num_1 + num_2)/2.0
end

def average_array(arry)
    return arry.sum/1.0/arry.length
end

def repeat(str, num)
    new_str = ""
    num.times {new_str += str}
    return new_str
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arry = str.split(" ")
    arry.map!.with_index do |word, idx|
        if idx == 0 || idx.even?
            word.upcase
        else
            word.downcase
        end
    end
    arry.join(" ")
end