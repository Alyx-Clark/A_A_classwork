def my_map(arry, &prc)
    new_arry = []
    arry.each do |ele|
        new_arry << prc.call(ele)
    end
    new_arry
end

def my_select(arry, &prc)
    new_arry = []
    arry.each do |ele|
        new_arry << ele if prc.call(ele)
    end
    new_arry
end

def my_count(arry, &prc)
    counter = 0
    arry.each do |ele|
        counter +=1 if prc.call(ele)
    end
    counter
end

def my_any?(arry, &prc)
    arry.each do |ele|
        return true if prc.call(ele)
    end
    false
end

def my_all?(arry, &prc)
    counter = 0
    arry.each do |ele|
        counter += 1 if prc.call(ele)
    end
    return true if counter == arry.length else return false
end


def my_none?(arry, &prc)
    arry.each do |ele|
        return false if prc.call(ele)
    end
    true
end


