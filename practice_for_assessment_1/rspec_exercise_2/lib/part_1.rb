def partition(arry, num)
    arry_less = []
    arry_more = []
    new_arry = []
    arry.each do |ele|
        if ele < num
            arry_less << ele
        else
            arry_more << ele
        end
    end
    new_arry << arry_less
    new_arry << arry_more
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each do |k,v|
        new_hash[k] = v
    end
    hash2.each do |k,v|
        new_hash[k] = v
    end
    new_hash
end

def censor(sent, arry)
    new_arry = sent.split(" ")
    new_arry.map! do |word|
        if arry.include?(word.downcase)
            vowel_replacer(word)
        else
            word
        end
    end
    new_arry.join(" ")
end

def vowel_replacer(word)
    vowels = "aeiouAEIOU"
    new_word = ""
    word.each_char do |char|
        if vowels.include?(char)
            new_word += "*"
        else
            new_word += char
        end
    end
    new_word
end

def power_of_two?(num)
    return true if num == 1
    boo = true
    while boo 
        num /= 2
        return true if num == 1
        return false if num.odd?
    end
end