def first_anagram?(string_1, string_2) #time o(n!)
    permutations = string_1.chars.to_a.permutation.map(&:join)
    permutations.include?(string_2)
end

def second_anagram?(string_1, string_2) #time o(n)
    return false if string_1.length != string_2.length 
    string_1.each_char.with_index do |char, i|
        if string_2.index(char) != nil  
            string_2.slice!(string_2.index(char))
        end
    end
    string_2.empty?
end


# p second_anagram?("gizmo", "sally") #false
# p second_anagram?("elvis", "lives") #true

def third_anagram?(string_1,string_2) #O(nlogn) which is slower than O(n)
    string_1.split("").sort == string_2.split("").sort 
end

# p third_anagram?("gizmo", "sally") #false
# p third_anagram?("elvis", "lives") #true


def fourth_anagram?(string_1,string_2) #O(1)
    hash = Hash.new {|h,k| h[k] = []}
    alphabet = "abcdefghijklmnopqrstuvwxyz"

    alphabet.each_char do |char|
        if string_1.include?(char) && string_2.include?(char)
            hash[char] << string_1.count(char)
            hash[char] << string_2.count(char)
        end
    end

    return false if hash.empty?

    hash.values.all? {|val| val[0] == val[1]}
   
    # string_1.each_char do |char|
    #     hash[char] = string_2.count(char)
    # end 
    # hash.values.all? {|val| val == 1}
end

p fourth_anagram?("gizmo", "sally") #false
p fourth_anagram?("elvis", "lives") #true