# Define your methods here. 
def first_letter_vowel_count(str)
    vowels = "aeiouAEIOU"
    count = 0
    arry = str.split(" ")
    arry.each do |word|
        count += 1 if vowels.include?(word[0])
    end
    count
end

def count_true(arry, prc)
    arry.count {|ele| prc.call(ele)}
end

def procformation(arry, prc1, prc2, prc3)
    arry.map! do |ele|
        if prc1.call(ele)
            prc2.call(ele)
        else
            prc3.call(ele)
        end
    end
end

def array_of_array_sum(arry)
    arry.flatten.sum
end

def selective_reverse(sent)
    vowels = "aeiou"
    new_arry = []
    arry = sent.split(" ")
    arry.each do |word|
        if !vowels.include?(word[0]) && !vowels.include?(word[-1])
            new_arry << word.reverse
        else
            new_arry << word
        end
    end
    new_arry.join(" ")
end

def hash_missing_keys(hash, *arg)
    arry = []
    return arry if arg.nil?
    arg.each do |args|
        arry << args if !hash.has_key?(args)
    end
    arry
end