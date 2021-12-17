def proper_factors(num)
    arry = []
    (1...num).select { |num2| num % num2 == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    false
end

def ideal_numbers(num)
    arry = []
    count = 1
    inf = 0
    while inf == 0
        arry << count if perfect_number?(count)
        count += 1
        break if arry.length == num
    end
    arry
end