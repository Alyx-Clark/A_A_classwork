# def strange_sums(arry)
#     new_arry = []
#     counter = 0
#     arry.each do |num1|
#         arry.select { |num2| counter +=1 if num2 + num1 == 0 }
#     end
#     counter/2
# end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0


# def pair_product(arry, product)
#     arry.each do |num1|
#         arry.each do |num2|
#             return true if num1*num2 == product && num1 != num2
#         end
#     end
#     false
# end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

# def rampant_repeats(str, hash)
#     new_str = ""
#     str.each_char do |char|
#         if hash.has_key?(char)
#             hash[char].times { new_str += char }
#         else
#             new_str += char
#         end
#     end
#     new_str
# end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


# def perfect_square(num)
#     squarert = Math.sqrt(num)
#     return true if squarert % 1 == 0
#     false
# end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

################################################################################ phase 2
# def anti_prime?(num)
#     hash = {}
#     (1..num).each do |num1|
#         hash[num1] = devisor_count(num1)
#     end
#     hash.max_by{|k,v| v}[0] == num
# end

# def devisor_count(num)
#     count = 0
#     (1..num).each do |num1|
#         if num % num1 == 0
#             count += 1
#         end
#     end
#     count
# end


# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false


# def matrix_addition(matrix_1, matrix_2)
#     newer_arry = []
#     (0...matrix_1.length).each do |num1|
#         new_arry = []
#         (0...2).each do |num2|
#             new_arry << matrix_1[num1][num2] + matrix_2[num1][num2]
#         end
#         newer_arry << new_arry
#     end
#     newer_arry
# end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]


# def mutual_factors(*num)
#     new_arry = []
#     (1..num.max).each do |num1|
#         check = num.all? { |num2| num2%num1 == 0}
#         if check 
#             new_arry << num1
#         end
#     end
#     new_arry
# end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]


# def tribonacci_number(num)
#     arry = [1,1,2]
#     return arry[num-1] if num<4
#     count = arry.length
#     while count < num
#         sum = 0
#         sum += arry[-1] + arry[-2] + arry[-3]
#         arry << sum
#         count += 1
#     end
#     return arry[-1]
# end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

##################################################################################### phase 3

def matrix_addition_reloaded(*matrix)
    
end