def hipsterfy(word)
    vowels = "aeiou"
    word.reverse!.each_char.with_index do |char,idx|
        if vowels.include?(char)
            word.slice!(char)
            break
        end
    end
    word.reverse!
end

def vowel_counts(str)
    str.downcase!
    vowels = "aeiou"
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char] += 1 if vowels.include?(char)
    end
    hash
end

def caesar_cipher(str, num)
    alphabet = ("a".."z").to_a
    new_str =""
    str.each_char.with_index do |char,idx|
        if alphabet.include?(char)
            old_idx = alphabet.index(char)
            new_idx = (old_idx + num) % 26
            new_str += alphabet[new_idx]
        else
            new_str += char
        end
    end
    new_str
end