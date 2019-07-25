# GOAL: to mimic the #times method
# 5.times do |num|
#     puts num
#   end
  
#   0
#   1
#   2
#   3
#   4
#   => 5


# def times(limit)
#     counter = 0

#     while counter < limit do
#       yield(counter) if block_given? 
#       counter += 1
#     end
#     limit
# end


# times(5) do |num|
#     puts num
#   end



###### Manual Each array method

def each(array)
    counter = 0

    while counter < array.size
        yield(array[counter])
        counter +=1
    end

    array
end

def select(arr)
    counter = 0
    new_arr = []
    while counter < arr.size
        new_arr << arr[counter] if yield(arr[counter])
        counter +=1
    end

    p new_arr

end

# array = [1, 2, 3, 4, 5]

# p array.select { |num| num.odd? }       # => [1, 3, 5]
# p array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
# p array.select { |num| num + 1 }   

p each([1, 2, 3, 4, 5]) { |num| 'do nothing'}.select {|num| num.odd?}

  