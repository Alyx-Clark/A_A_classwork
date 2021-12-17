def hipsterfy(word)
    vowels = "aeiou"
    word.reverse.each_char do |char|
        if vowels.include?(char)
            new_word = word.reverse
            new_word.slice!(char)
            return new_word.reverse
        end
    end
    return word
end

def vowel_counts(str)
    str.downcase!
    hash = {}
    vowels = "aeiou"
    str.each_char do |char|
        if vowels.include?(char)
            hash[char] = str.count(char)
        end
    end
    return hash
end


def caesar_cipher(message, n)
    message.downcase!
    new_str = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz"

    message.each_char.with_index do |char, idx1|
        alphabet.each_char.with_index do |letter, idx2|
            if letter == char
                m = n % 26
                if idx2 + m > 25
                    new_str += alphabet[idx2+m-26]
                else
                    new_str += alphabet[idx2 + m]
                end
            end
        end
        if !alphabet.include?(char)
            new_str += char
        end
    end
    return new_str
end

