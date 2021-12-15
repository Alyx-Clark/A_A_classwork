def proper_factors(num)
    new_arry = []
    (1...num).each do |ele|
        new_arry << ele if num%ele == 0
    end
    new_arry
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    false
end

def ideal_numbers(num)
    i = 2
    boo = true
    new_arry = []
    while boo
        new_arry << i if perfect_number?(i)
        break if new_arry.length == num
        i+=1
    end
    new_arry
end