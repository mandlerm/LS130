require 'minitest/autorun'
require_relative 'Med1'

class BubbleSortTesting < Minitest::Test
    def bubble_sort!(array)
        loop do
            swapped = false
            1.upto(array.size - 1) do |index|
            if block_given?
                next if yield(array[index-1],array[index])
            else
                next if array[index - 1] <= array[index]
            end
            array[index - 1], array[index] = array[index], array[index - 1]
            swapped = true
            end
        
            break unless swapped
        end
        nil
      end


    def test_first
        array = [5, 3]
        assert_equal([3,5], bubble_sort!(array))
    end

    def test_second
        assert true
    end
end