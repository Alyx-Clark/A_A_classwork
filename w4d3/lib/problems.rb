
def remove_dups(array)
    new_array = []
    array.each do |num|
        new_array << num unless new_array.include?(num)
    end
    new_array
end

def two_sum(array)
    pairs = []
    array.each_with_index do |num_1, i_1|
        array.each_with_index do |num_2, i_2|
            pairs << [i_1,i_2] if num_1 + num_2 == 0 && i_2 > i_1
        end 
    end
    pairs
end

def my_transpose(array)
    new_array = []
    array.each_with_index do |subarray, i|
        new_subarray = []
        subarray.each_with_index do |ele, j|
            new_subarray << array[j][i]
        end
        new_array << new_subarray
    end
    new_array
end

# def stock_picker(array)
#     most_profit = [] #pair
#     profit = 0 # max_profit = 6  9 - 3
#     array.each_with_index do |price, day|
#         array.each_with_index do |price2,day2|
#             most_profit = [day,day2] if price2 - price > most_profit
#     end
#     most_profit
# end

def stock_picker(array)
    pair = [] 
    most_profit = 0
    array.each_with_index do |buy, day|
        array.each_with_index do |sell, day2|
            if sell - buy > most_profit && day2 > day
                pair = [day, day2]
                most_profit = sell - buy
            end
        end
    end
    pair
end