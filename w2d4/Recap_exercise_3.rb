# require "byebug"
# def no_dupes?(arr)
#     new_arry = []
#     arr.each do |ele|
#         # debugger
#         num = arr.count(ele)
#         new_arry << ele if num < 2
#     end
#     new_arry
# end

# # Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


# def no_consecutive_repeats?(arry)
#     (0...arry.length-1).each do |idx|
#         return false if arry[idx] == arry[idx+1]
#     end
#     true
# end

# # Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true




# def char_indices(str)
#     hash = Hash.new()
#     str.each_char.with_index do |char,idx|
#         if hash.has_key?(char)
#             hash[char] << idx
#         else
#             hash[char] = [idx]
#         end
#     end
#     hash
# end


# # Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


# def longest_streak(str)
#     current_streak = ""
#     best_streak = ""
#     (0...str.length).each do |i|
#         if str[i] == str[i-1] || i == 0
#             current_streak += str[i]
#         else
#             current_streak = str[i]
#         end
#         best_streak = current_streak if current_streak.length >= best_streak.length
#     end
#     best_streak
# end

# # Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


# def bi_prime?(num)
#     (2...num).each do |idx1|
#         (2...num).each do |idx2|
#             return true if is_prime?(idx1) && is_prime?(idx2) && idx1 * idx2 == num
#         end
#     end
#     false
# end

# def is_prime?(num)
#     return false if num < 2
#     return true if num == 2
#     (2...num).each do |i|
#         return false if num % i == 0
#     end
#     true
# end

# # Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false


# def vigenere_cipher(message, keys)
#     alph = ("a".."z").to_a
#     cipher = ""
#     key_mod = keys.length
#     message.each_char.with_index do |char, idx|
#         old_index = alph.index(char)
#         new_index = (old_index + keys[idx % key_mod]) % 26
#         cipher += alph[new_index]
#     end
#     cipher
# end

# # Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

# def vowel_rotate(str)
#     new_str = str[0..-1]
#     vowels = "aeiou"

#     vowel_idxs = (0...str.length).select { |ele| vowels.include?(str[ele]) }
#     rotate_idxs = vowel_idxs.rotate(-1)

#     vowel_idxs.each_with_index do |vowel_idx, i|
#         new_vowel = str[rotate_idxs[i]]
#         new_str[vowel_idx] = new_vowel
#     end
#     new_str
# end

# # Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


