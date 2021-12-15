# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    prime_divisors = []
    (1..num).each do |i| 
        if num % i == 0 && prime?(i)
            prime_divisors << i
        end
    end
    prime_divisors.max
end


def prime?(num)
    return true if num == 2
    return false if num < 2
    (2...num).each { |i| return false if num % i == 0}
    true
end


def unique_chars?(str)
    str.each_char { |char| return false if str.count(char)>1 }
    true
end


def dupe_indices(arr)
    hash = {}
    arr.each_with_index do |char, idx|
        if arr.count(char) > 1
            if hash.has_key?(char)
                hash[char] << idx
            else
                hash[char] = []
                hash[char] << idx
            end
        end
    end
    hash
end


def ana_array(arr_1, arr_2)
    return false if arr_1.length != arr_2.length
    arr_1.each { |ele| return false if !arr_2.include?(ele) }
    arr_2.each { |ele2| return false if !arr_1.include?(ele2) }
    true
end