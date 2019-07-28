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


def zip(arr1, arr2)

    zipped_arr = []
    counter = 0

    while counter < arr1.length 
        zipped_arr << [arr1[counter], arr2[counter]]
        counter += 1
    end
    

end


p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]