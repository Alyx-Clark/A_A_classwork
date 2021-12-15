def reverser(str, &prc)
    prc.call(str.reverse)
end


def word_changer(str, &prc)
    str.split(" ").map! { |word| prc.call(word) }.join(" ")
end


def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num) then return prc1.call(num) else return prc2.call(num) end
end


def and_selector(arry, prc_1, prc_2)
    arry.select { |ele| prc_1.call(ele) && prc_2.call(ele) }
end



def alternating_mapper(arry, prc_1, prc_2)
    arry.map!.with_index do |ele, idx|
        if idx.even?
            prc_1.call(ele)
        else
            prc_2.call(ele)
        end
    end
    arry
end