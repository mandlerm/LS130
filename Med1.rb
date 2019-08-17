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

