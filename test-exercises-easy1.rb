# 2

# def compute
#     return "Does not compute." unless block_given?
#     yield
# end


# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'


#### 2

# def missing(arr) 
#     lowest = arr.first
#     highest = arr.last
#     newarr = []

#     (lowest..highest).each {|n|  newarr << n if !arr.include?(n)}
#     newarr
# end


# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []



#### 3

# def divisors(num)
#     divs = []

#     (1..num).each {|n| divs << n if num % n == 0}
#     divs
# end


# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] 



# ##### 4
# class Decrypt

# CODE = {'a' => 'n', 'b'=> 'o', 'c'=> 'p', 'd'=> 'q', 'e'=> 'r', 'f'=> 's', 'g'=> 't', 'h'=> 'u', 'i'=> 'v', 'j'=> 'w', 'k'=> 'x', 'l'=> 'y', 'm'=> 'z', 'n'=> 'a', 'o'=> 'b', 'p'=> 'c', 'q'=> 'd', 'r'=> 'e', 's'=> 'f', 't'=> 'g', 'u'=> 'h', 'v'=> 'i', 'w'=> 'j', 'x'=> 'k', 'y'=> 'l', 'z'=> 'm' }

#     def decode(msg)
#        newMsg = msg.downcase!.split(" ").map do  |name| 

#         name.split('').map {|l| CODE[l]}.join.capitalize
#        end.join(' ')
#         p newMsg
#     end

# end

# decoder = Decrypt.new 

# names = [
# 'Nqn Ybirynpr',
# 'Tenpr Ubccre',
# 'Nqryr Tbyqfgvar',
# 'Nyna Ghevat',
# 'Puneyrf Onoontr',
# 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
# 'Wbua Ngnanfbss',
# 'Ybvf Unvog',
# 'Pynhqr Funaaba',
# 'Fgrir Wbof',
# 'Ovyy Tngrf',
# 'Gvz Orearef-Yrr',
# 'Fgrir Jbmavnx',
# 'Xbaenq Mhfr',
# 'Fve Nagbal Ubner',
# 'Zneiva Zvafxl',
# 'Lhxvuveb Zngfhzbgb',
# 'Unllvz Fybavzfxv',
# 'Tregehqr Oynapu',
# ]

# names.each {|name| decoder.decode(name) }




##### 5

# def any?(arr)
#     counter = 0
#     while counter < arr.length
        
#         return true if yield(arr[counter])
#         counter += 1
#     end
#     return false
# end



# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false




###### 6

# def all?(arr)

#     arr.each {|el| return false unless yield(el) }
#     true
# end


# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true


###### 7

# def none?(arr)
#     arr.each {|el| return false if yield(el)}
#     true

# end


# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true



# #### 8
# def one?(arr)
#     counter = 0

#     arr.each do 
#         |el| counter+= 1 if yield(el)
#         return false if counter > 1
#     end
#     counter == 1
# end

# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false


# def count(arr)
#     counter = 0
#     arr.each {|el| counter += 1 if yield(el)}
#     counter
# end


# p count([1,2,3,4,5]) { |value| value.odd? } == 3
# p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# p count([1,2,3,4,5]) { |value| true } == 5
# p count([1,2,3,4,5]) { |value| false } == 0
# p count([]) { |value| value.even? } == 0
# p count(%w(Four score and seven)) { |value| value.size == 5 } == 2