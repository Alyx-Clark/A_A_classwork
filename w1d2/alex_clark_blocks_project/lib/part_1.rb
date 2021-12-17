def select_even_nums(arry)
    arry.select { |num| num.even?} 
end


def reject_puppies(arry)
    arry.reject{ |hash| hash["age"] < 3 }
end

def count_positive_subarrays(arry)
    arry.count { |sub_arry| sub_arry.sum > 0}
end


def aba_translate(word)
    word.downcase!
    str = ""
    vowels = "aeiou"
    word.each_char.with_index do |char, idx|
        str += char
        if vowels.include?(char)
            str += "b"
            str += char
        end
    end
    str
end

def aba_array(arry)
    arry.map { |word| aba_translate(word)}
end