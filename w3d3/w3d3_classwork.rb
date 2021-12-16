require "byebug"
def range(start, last_num)
    return [] if last_num < start
    return [start] if last_num-start == 1
    # new_arry = []
    # (start...last_num).each do |idx|
    #     new_arry << idx
    # end
    # new_arry
    previous = range(start, last_num-1)
    sum = previous.last + 1
    previous << sum
    previous
end

# p range(1, 5)

def recur_sum(array)
   return array[0] if array.length <= 1
   array[0] += recur_sum(array[1..-1])
end

# p recur_sum([1,2,3,4])

# def exp(base, exp)
#    return 1 if exp == 0 
#    return 0 if base == 0 
#    return base if exp == 1

#    base * exp(base, exp -1)  
# end

# p exp(2, 0)  # 16

def exp(base, exp)
    return 1 if exp == 0 
    return 0 if base == 0 
    return base if exp == 1

    if exp.even?
        exp(base, exp/2) ** 2
    else
        base * (exp(base, (exp - 1) / 2) ** 2)
    end
end

# p exp(2, 4) # 16

# def dup(arry)
#     return [] if arry.empty?
#     return arry if arry.length == 1
#     return arry if arry.is_a? Array
#     arry.first + dup(arry[1..-1])
# end

# p dup([ ["nuts", "bolts", "washers"], ["capacitors", "resistors", "inductors"] ])
# p dup([1, [2], [3, [4]]])


# [1,1,2,3, 5 ]
def fib(n)
   return [1] if n == 1
   return [1,1] if n == 2
      
   prev = fib(n-1)  #fib(4)
   sum = prev[-2] + prev[-1]
   prev << sum
   prev
end

# p fib(5)

# debugger
def b_search(array, target)
    return false if array.empty?
    if array.first == target && array.length == 1
        return array.index(array.first)
    else
        nil
    end

   middle_idx = array.length/2 # 2
   left = array.take(middle_idx) # [1,2]   
   right = array.drop(middle_idx + 1) # [10]

    if array[middle_idx] < target # true
        b_search(right, target)         
    else
        b_search(left, target)     #b_search([3], 1)
    end

end




def b_search(array, target)
   return nil if array.empty?  #stop searching when the array is empty
   
   middle_idx = array.length/2 # 3
   left = array.take(middle_idx) # [1,2,3]   
   right = array.drop(middle_idx + 1) # [10, 100]

   if array[middle_idx] == target
      return middle_idx
   elsif array[middle_idx] < target  
      value = b_search(right, target)
      if value == nil    #if the target element is not in the right side of the array
         return nil
      else
         value + middle_idx + 1 #if target found, replenish the index in the original array
      end
   else 
      b_search(left, target)      
   end
   
end

# p b_search([1, 2, 10, 15, 20, 100], 10)

def merge_sort(array)
    if array.length == 1
        #merge halves
        #return merge halves
    end
    middle_idx = array.length/2
    left = array.take(middle_idx)
    right = array.drop(middle_idx)
    final_left = merge_sort(left)
    final_right = merge_sort(right)
    if array.length == 1
        if final_left > final_right
            return left + right
        else
            return right + left
        end
    end

end

# p merge_sort([38,27,43,3,9,82,10]) # [3,9,10,27,38,43,82]





def subsets(arr)
   return [[]] if arr == []
   # return [] if arr.empty?
   # return [[],[arr.first]] if arr.length == 1
   
   # subsets([n]) += [[],[n]]
   set = subsets(arr[0...-1])   #[1]
   # set.concat(set.map { |x| x += [arr.last] })
end

p subsets([1, 2, 3])

# p subsets([2]) # => [[], [2]]




