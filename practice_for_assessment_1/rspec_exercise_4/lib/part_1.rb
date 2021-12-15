def my_reject(arry, &blk)
    new_arry = []
    arry.each do |ele|
        new_arry << ele if !blk.call(ele)
    end
    new_arry
end

def my_one?(arry, &blk)
    count = arry.each.count { |ele| blk.call(ele)}
    return true if count == 1 else return false
end

def hash_select(hash, &blk)
    new_hash = {}
    hash.each do |k,v|
        if blk.call(k,v)
            new_hash[k] = v
        end
    end
    new_hash
end

def xor_select(arry, prc_1, prc_2)
    arry.select { |ele| (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele)) }
end

def proc_count(val, arry)
    arry.each.count { |prc| prc.call(val) }
end