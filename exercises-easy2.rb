
# ##### 1 FROM-TO-STEP SEQUENCE GENERATOR


# def step(start, last, skip)
#     puts 'hi'
#     counter = start
#     while counter <= last do
#         yield(counter)
#         counter += skip
#     end
#     self
# end

# p step(1, 10, 3) { |value| puts "value = #{value}" }

# # step(1,10,3) { |value| puts "value = #{value}" }


##### 2 ------  ZIPPER 


# def zip(arr1, arr2)

#     zipped_arr = []
#     counter = 0

#     while counter < arr1.length 
#         zipped_arr << [arr1[counter], arr2[counter]]
#         counter += 1
#     end
#     zipped_arr

# end


# p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]



##### 3 ---- MAP

# def map(arr)
#     nu = []
#     arr.each {|el| nu << yield(el)}
#     nu

# end




# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]



#######    4    COUNT


# def count(*arr)
#     count = 0

#     arr.each { |el| count+=1 if yield(el)}
#     count

# end


# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3




######## 5 DROP_WHILE

# def drop_while(arr)
#     drop = false
#     d_arr = []

#     arr.each do |el|
        
#         if drop 
#             d_arr << el
#         else
#             if !(yield(el))
#                 d_arr << el
#                 drop = true
#             end
#         end
#     end
#     d_arr

# end 


# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []




########### 6  EACH_WITH_INDEX
# def each_with_index(arr)

#     counter = 0
#     while counter < arr.length
#         yield(arr[counter], counter)
#         counter += 1
#     end
#     arr 
# end


# result = each_with_index([1, 3, 6]) do |value, index|
#     puts "#{index} -> #{value**index}"
#   end
  
#   puts result == [1, 3, 6]




########### 7   EACH_WITH_OBJECT

# def each_with_object(arr, obj)
#     arr.each {|val| yield(val, obj)}
#     obj
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#     list << value**2
#   end
#   p result == [1, 9, 25]
  
#   result = each_with_object([1, 3, 5], []) do |value, list|
#     list << (1..value).to_a
#   end
#   p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]
  
#   result = each_with_object([1, 3, 5], {}) do |value, hash|
#     hash[value] = value**2
#   end
#   p result == { 1 => 1, 3 => 9, 5 => 25 }
  
#   result = each_with_object([], {}) do |value, hash|
#     hash[value] = value * 2
#   end
#   p result == {}



####### 8 max_by

def max_by(arr)
    return nil if arr.empty?
    max = arr.first
    highest_val = yield(arr.first)

    arr.each do |num| 
        ans = yield(num)
        
        if ans > highest_val
          highest_val = ans
          max = num 
        end
    end
    max
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil




######## 9 each_cons


# def each_cons(arr)
#   counter = 0
#   until counter +2 > arr.length
#     yield(arr[counter], arr[counter+1])
#     counter += 1
#   end
#   nil
# end

# def each_cons(arr)
#   arr.each_with_index do |item, index|
#     break if index + 1 >= arr.length
#     yield(item, arr[index+1])
#   end
#   nil
# end


# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}
# p result == nil



# def each_cons(arr, num)
#   arr.each_with_index do |item, index|
#     break if index + num -1 >= arr.length
#     yield(*arr[index..(index+num-1)])
#   end
#   nil
# end

# hash = {}
# each_cons([1, 3, 6, 10], 1) do |value|
#   hash[value] = true
# end
# p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
  
#   hash[value1] = value2
# end
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {} 
# each_cons([1, 3, 6, 10], 3) do |value1, *values|
#   hash[value1] = values
# end
# p hash == { 1 => [3, 6], 3 => [6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 4) do |value1, *values|
#   hash[value1] = values
# end
# p hash == { 1 => [3, 6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values|
#   hash[value1] = values
# end
# p hash == {}