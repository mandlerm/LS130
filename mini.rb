# require 'minitest/autorun'

# class MyFirstTest < Minitest::Test
#     def test_first_test
#         assert true
#     end
# end



require 'minitest/autorun'

class EqualityTest < Minitest::Test
    def test_value_equality
        str1 = 'hi there'
        str2 = 'hi there'
        str3 = str3

        assert_equal(str1,str2)
        assert_same(str1,str2)
        assert_same(str3,str2)
    end
end