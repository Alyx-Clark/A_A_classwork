def zip(*arry)
    length = arry.first.length
    (0...length).map do |i|
        arry.map { |ele| ele[i] }
    end
end

def prizz_proc(arry, prc_1, prc_2)
    arry.select { |ele| (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele)) }
end

def zany_zip(*arry)
    length = arry.map(&:length).max
    (0...length).map do |i|
        arry.map { |sub_arry| sub_arry[i]}
    end
end

def maximum(arry, &prc)
    return nil if arry.empty?
    max = arry.first
    arry.each do |ele|
        max = ele if prc.call(ele) >= prc.call(max)
    end
    max
end

def my_group_by(arry, &prc)
    hash = Hash.new()
    arry.each do |ele|
        key = prc.call(ele)
        if hash.has_key?(key)
            hash[key] << ele
        else
            hash[key] = []
            hash[key] << ele
        end
    end
    hash
end

def max_tie_breaker(arry, prc, &blc)
    return nil if arry.empty?
    max = arry.first
    arry.each do |ele|
        result = blc.call(ele)
        max_result = blc.call(max)
        if result > max_result
            max = ele
        elsif result == max_result && prc.call(ele) > prc.call(max)
            max = ele
        end
    end
    max
end


def silly_syllables(sent)
    vowels = "aeiou"
    arry = sent.split(" ")
    arry.map do |word|
        if word.count(vowels) > 1
            letter_remover(word)
        else
            word
        end
    end
    arry.join(" ")
end

def letter_remover(word)
    vowels = "aeiou"
    word.each_char.with_index do |char, idx| 
        if vowels.include?(char)
            word.slice!(word[0...idx])
            break
        end
    end

    word.reverse!.each_char.with_index do |char, idx|
        if vowels.include?(char)
            word.slice!(word[0...idx])
            break
        end
    end

    word.reverse!
end