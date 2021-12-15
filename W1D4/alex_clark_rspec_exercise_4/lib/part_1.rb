def my_reject(arr,&prc)
    arry = []
    arr.each do |num|
        if !prc.call(num)
            arry << num
        end
    end
    arry
end

def my_one?(arry, &prc)
    counter = 0
    arry.each { |ele| counter += 1 if prc.call(ele) }
    return true if counter == 1
    false
end 

def hash_select(hash, &prc)
    new_hash = {}
    hash.each do |k,v|
        if prc.call(k, v)
            new_hash.merge!(k => v)
        end
    end
    new_hash
end

def xor_select(arry, prc1, prc2)
    arry.select { |ele| (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele)) }
end

def proc_count(ele, arry)
    counter = 0
    arry.each { |prc| counter +=1 if prc.call(ele)}
    counter
end