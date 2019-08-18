#######  1 Listening Device ##########

# class Device
#     def initialize
#       @recordings = []
#     end
  
#     def record(recording)
#       @recordings << recording
#     end

#     def listen
#         record(yield) if block_given?
#     end

#     def play
#         puts @recordings.last
#     end
#   end


# listener = Device.new
# # listener.listen { "Hello World!" }
# # listener.listen
# # listener.play # Outputs "Hello World!"

# listener.listen




####### 2 Text Analyzer - Sandwich Code ########
# class TextAnalyzer
#     def process
#       file = File.open("testfile.txt")
#       puts yield(file)
#       file.close
#     end
#   end
  
#   analyzer = TextAnalyzer.new
#   analyzer.process { |f|
#             paragraphs = f.read.split(/\n\n/).length
#             "#{paragraphs} paragraphs"
#         }
#   analyzer.process { |f| 
#              lines = f.readlines.map(&:chomp)
#             "#{lines.count} lines"
#         }

#   analyzer.process { |f| 
#             w = f.read.split(" ").count
#             "#{w} words"
    
#         }



##########  3 Passing Parameters Part 1  #############

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#     puts "Let's start gathering food."
#     yield(items)
#     puts "Nice selection of food we have gathered!" 
# end


# gather(items) {|list| puts list.join('; ')}



##########  4 Passing Parameters Part 2  #############

# def raptor_capture(arr)
#     yield(arr)
# end

# raptor_capture(%w(raven finch hawk eagle)) do |arr|
#     first, second, *raptors = arr
#     p raptors
# end


# raven, finch, *raptors = %w(raven finch hawk eagle)



##########  5 Passing Parameters Part 3  #############

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
# p items
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# 1
# gather(items) do |*first, last |
#     puts first.join(', ')
#     puts last
#   end

# 2
# gather(items) do |first ,*second ,last |
#     puts first
#     puts second.join(', ')
#     puts last
#   end


# 3
# gather(items) do |first ,*last |
#     puts first
#     puts last.join(', ')
#   end


# 4
# gather(items) do |first ,second ,third ,last |
#     puts "#{first}, #{second}, #{third}, and #{last}"
#   end


# gather(items)


########### 6 Method to Proc ############

# def convert_to_base_8(n)
#     n.to_s(8).to_i # replace these two method calls
# end
  
#   # The correct type of argument must be used below
#   base8_proc = method(:convert_to_base_8).to_proc
  
#   # We'll need a Proc object to make this code work. Replace `a_proc`
#   # with the correct object
#   p [8, 10, 12, 14, 16, 33].map(&base8_proc)



######## 6 Bubble Sort with Blocks  ##########

# def bubble_sort!(array)
#     loop do
#         swapped = false
#         1.upto(array.size - 1) do |index|
#         if block_given?
#             next if yield(array[index-1],array[index])
#         else
#             next if array[index - 1] <= array[index]
#         end
#         array[index - 1], array[index] = array[index], array[index - 1]
#         swapped = true
#         end
    
#         break unless swapped
#     end
#     nil
#   end


# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# array == %w(alice bonnie Kim Pete rachel sue Tyler)



def bubble_sort!(array)
    loop do
        swapped = false
        1.upto(array.size - 1) do |index|
        if block_given?
            next if yield(array[index])
        end
        next if array[index - 1] <= array[index]
        
        array[index - 1], array[index] = array[index], array[index - 1]
        swapped = true
        end
    
        break unless swapped
    end
    nil
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)

require 'minitest/autorun'

class BubbleSortTesting < Minitest::Test
    def test_new
        array = %w(sue Pete alice Tyler rachel Kim bonnie)
        bubble_sort!(array) { |value| value.downcase }
        assert(%w(alice bonnie Kim Pete rachel sue Tyler), array)
    end
#     def test_first
#         array = [5, 3]
#         bubble_sort!(array)
#         assert_equal([3,5], array)
#     end

#     def test_second
#         array = [5, 3, 7]
#         bubble_sort!(array) { |first, second| first >= second }
#         assert([7, 5, 3], array)
#     end

#     def test_third
#         array = [6,2,7,1,4]
#         bubble_sort!(array)
#         assert([1,2,4,6,7], array)
#     end

#     def test_fourth
#         array = %w(sue Pete alice Tyler rachel Kim bonnie)
#         bubble_sort!(array)
#         assert(%w(Kim Pete Tyler alice bonnie rachel sue), array)
#     end

#     def test_five
#         array = %w(sue Pete alice Tyler rachel Kim bonnie)
#         bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
#         assert(%w(alice bonnie Kim Pete rachel sue Tyler), array)
#     end 
end