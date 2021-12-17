def zip(*arry)
    new_arry = []
    (1..arry[0].length).each { |num| new_arry << [] }
    (0..arry.length-1).each do |num2|
        new_arry.each_with_index do |empty,idx|
            empty << arry[num2][idx]
        end
    end
    new_arry
end


def prizz_proc(arry, prc1, prc2)
    arry.select { |ele| (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele)) }
end


def zany_zip(*arry)
    new_arry = []
    idx = arry.index(arry.max_by{|x| x.length})
    (1..arry[idx].length).each { |num| new_arry << [] }
    (0..arry.length-1).each do |num2|
        new_arry.each_with_index do |empty,idx|
            empty << arry[num2][idx]
        end
    end
    new_arry
end


def maximum(arry, &prc)
    return nil if arry.empty?
    new_arry = []
    int = arry.all? {|x| x.is_a? Integer }
    #str = arry.all? {|x| x.is_a? String}
    if int
        arry.each { |ele| new_arry << prc.call(ele) }
        idx = new_arry.index(new_arry.max)
        return arry[idx]
    else
        arry.each { |ele| new_arry << prc.call(ele) }
        sizze = new_arry.max
        arry.reverse.each { |ele2| return ele2 if ele2.length == sizze}
    end
end


def my_group_by(arry, &prc)
    hash = {}
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


require "byebug"

def max_tie_breaker(arry, prc1, &prc2)
    return nil if arry.empty?
    sorted_arry = arry.max_by(arry.length){|x| prc2.call(x)}
    if prc2.call(sorted_arry[0]) != prc2.call(sorted_arry[1])
        return sorted_arry[0]
    end
    
    #debugger
    tie_arry = []
    arry.each do |ele|
        if prc2.call(ele) == prc2.call(sorted_arry[0])
            tie_arry << ele
        end
    end

    #debugger
    hash = {}
    tied_sorted_arry = tie_arry.max_by(tie_arry.length){|x| prc1.call(x)}
    if prc1.call(tied_sorted_arry[0]) != prc1.call(tied_sorted_arry[1])
        return tied_sorted_arry[0]
    else
        tied_sorted_arry.each do |ele|
            hash[ele] = arry.index(ele)
        end
        return hash.key(hash.values.min)
    end

end


def silly_syllables(sent)
    vowels = "aeiou"
    arry = sent.split(" ")
    arry.each do |word|
        counter = 0
        word.each_char do |char|
            counter +=1 if vowels.include?(char)
        end
        vowel_remover(word) if counter > 1
    end
    arry.join(" ")
end

def vowel_remover(str)
    vowels = "aeiou"
    str.each_char.with_index do |char,idx|
        if vowels.include?(char)
            str.slice!(str[0...idx])
            break
        end
    end
    
    str.reverse!.each_char.with_index do |char,idx|
        if vowels.include?(char)
            str.slice!(str[0...idx])
            break
        end
    end
    str.reverse!
end