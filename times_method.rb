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


def times(limit)
    counter = 0

    while counter < limit do
      yield(counter) if block_given? 
      counter += 1
    end
    limit
end


times(5) do |num|
    puts num
  end