
def partition(arry, num)
    new_arry = []
    less = arry.select { |ele1| ele1 < num }
    greater_or_equal = arry.select { |ele2| ele2 >= num }
    new_arry << less
    new_arry << greater_or_equal
end


def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each do |k,v|
        new_hash[k] = v
    end
    hash_2.each do |k,v|
        new_hash[k] = v
    end
    new_hash
end


def censor(sentence, curse_words)
    sentence_arry = sentence.split(" ")
    new_arry = sentence_arry.map do |word|
        if curse_words.include?(word.downcase)
            sensoring(word)
        else
            word
        end
    end
    new_arry.join(" ")
end

def sensoring(str)
    vowels = "aeiou"
    new_str = ""

    str.each_char do |char|
        if vowels.include?(char.downcase)
            new_str += "*"
        else
            new_str += char
        end
    end
    new_str
end


def power_of_two?(num)
    return true if num == 1
    while num >= 2.0
        return true if num == 2
        num /= 2
    end
    false
end