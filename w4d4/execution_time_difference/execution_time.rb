require "byebug"

# def my_min(list) #O(n^2)
#     num1 = list[0]
#     list.each do |ele1|
#         list.each do |ele2|
#             num1 = ele1 if ele1 < ele2 && ele1 < num1
#         end
#     end
#     num1
# end

def my_min(list) #O(n)
    num1 = list[0]
    list.each do |ele|
        num1 = ele if ele < num1
    end
    num1
end


# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# def largest_contiguous_subsum(list) #O(n^2)
#     array = []

#     (0...list.length).each do |i| #O(n)
#         # subarr = []
#         (i...list.length).each do |j| #O(n)
#             subarr = list[i..j]
#             array << subarr
#         end 
#     end

#     max = array[0].sum
#     array.each do |subarr| #O(n)
#         max = subarr.sum if subarr.sum > max
#     end
#     max
# end


def largest_contiguous_subsum(list) #O(n)
    largest_sum = list[0]
    current_sum = 0


    list.each_with_index do |ele,i|
        current_sum += ele 
        largest_sum = current_sum unless current_sum < largest_sum
        current_sum = 0 if current_sum < 0
    end

    largest_sum
end



# list = [5, 3, -7]
# p largest_contiguous_subsum(list)


#largest sum 0
#current sum equal largest sum
#step through array and track of the cur sum. if cur > largest reassign largest
# cur sum/largest = 5, then cur sum becomes -1, need to break and start at next ele

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])