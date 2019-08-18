class Text
    attr_reader :text
    def initialize(text)
      @text = text
    end
  
    def swap(letter_one, letter_two)
        @text = @text.gsub(letter_one, letter_two)
    end

    def word_count
        @text.split.count
    end
end


require 'minitest/autorun'


class TextTest < MiniTest::Test
    attr_accessor :f
    def setup
        @f = File.open("sample_text.txt", 'r')
    end 

    def teardown
        @f.close
        puts "File has been closed: #{@f.closed?}"
    end

    def test_swap
        text = Text.new(@f.read)
        actual_text = text.swap('a','e')
        expected_text = <<~TEXT.chomp
        Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
        Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
        quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
        nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
        dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
        et verius meuris, et pheretre mi.
        TEXT

        assert_equal(actual_text, expected_text)
    end

    def test_word_count
        text = Text.new(@f.read)
        
        assert_equal(72, text.word_count)
    end
end