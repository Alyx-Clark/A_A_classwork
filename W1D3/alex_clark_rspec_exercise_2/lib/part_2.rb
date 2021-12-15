def palindrome?(str)
    str_reverse = ""
    counter = -1
    (1..str.length).each do |num|
        str_reverse += str[counter]
        counter -= 1
    end
    str == str_reverse
end



def substrings(str)
    arry = []
    (0...str.length).each do |num1|
        new_str = ""
        (num1...str.length).each do |num2|
            new_str += str[num2]
            arry << new_str
        end
    end
    arry
end


def palindrome_substrings(str)
    new_arry = []
    sub_strings = substrings(str)
    sub_strings.each do |word|
        new_arry << word if palindrome?(word) && word.length > 1
    end
    new_arry
end