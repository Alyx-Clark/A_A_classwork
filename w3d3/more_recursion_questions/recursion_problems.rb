#Problem 1: 

def sum_recur(array)
    return array[0] if array.length <= 1
    array[0] + sum_recur(array[1..-1]) 
end

# p sum_recur([1,2,3,4,5]) # 15

#Problem 2: 

def includes?(array, target)

    count += 1 if array[0] ==
end

# p includes?([1,2,3,4,5], 3) # true
# p includes?([1,2,4,5], 3) # false


# Problem 3: 

def num_occur(array, target)
    count = 0
    return count if array.length <= 1
    count +=1 if array[0] == target
    num_occur(array[1..-1], target)
end

p num_occur([1,2,3,3,4,5], 3)

# Problem 4: 

def add_to_twelve?(array)
end

# Problem 5: 

def sorted?(array)
end

# Problem 6: 

def reverse(string)
end

# def fib(n)
#     return n if n <= 1
#     (fib(n-1) + fib(n-2))
# end

# p fib(5)