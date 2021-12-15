def aba_translate(str)
    arry = str.split(" ")
    new_arry = []
    arry.each do |word|
        a = vowel_adder(word)
        new_arry << a
    end
    new_arry.join(" ")
end

def vowel_adder(word)
    vowels = "aeiouAEIOU"
    new_word += ""
    word.each_char do |char|
        new_word += char
        if vowels.include?(char)
            new_word += "b"
            new_word += char
        end
    end
    new_word
end

aba_translate("Cat and dogs") #=> “Cabats aband dobogs”

aba_translate("Everyone can code") #=> “Ebeveryobonebe caban cobodebe”

aba_translate("Africa is Africa in German") #=> “Abafribicaba ibis Abafribicaba ibin Gebermaban”