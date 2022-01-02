def bad_two_sum(arr,target) #O(n^2)
    arr.each_with_index do |ele1,i|
        arr.each_with_index do |ele2,j|
            return true if ele1 + ele2 == target && j > i
        end
    end
    false
end


# arr = [0, 1, 5, 7]
# p bad_two_sum(arr, 6) # => should be true
# p bad_two_sum(arr, 10) # => should be false

def okay_two_sum?(arr,target) #O(nlogn)
    sorted_arr = arr.sort #nlogn

    return false if arr.length == 0

    # mid = arr.length / 2
    i = 0
    j = sorted_arr.length - 1

    while i < arr.length && i != j                           #n
        case sorted_arr[i] + sorted_arr[j] <=> target
        when 0
            return true
        when 1
            j -= 1
            # return okay_two_sum?(sorted_arr[0...mid],target)
        when -1
            i += 1
            # return okay_two_sum?(sorted_arr[mid+1..-1],target)
        end
    end
    false
end

arr = [0, 1, 5, 7, 2, 3]   # [0, 1, 2, 3, 5, 7]
p okay_two_sum?(arr,3)      # true
p okay_two_sum?(arr,15)      # false


def hash_map(arr, target)

end

# arr = [0, 1, 5, 7, 2, 3]
# p hash_map(arr,5)         #return true
# p hash_map(arr,9)         #return false