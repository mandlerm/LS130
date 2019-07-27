require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
SimpleCov.start

Minitest::Reporters.use!

require_relative 'TodoListRuby'

class TodoListTest < MiniTest::Test

    def setup
        @todo1 = Todo.new("Buy milk")
        @todo2 = Todo.new("Clean room")
        @todo3 = Todo.new("Go to gym")
        @todos = [@todo1, @todo2, @todo3]

        @list = TodoList.new("Today's Todos")
        @list.add(@todo1)
        @list.add(@todo2)
        @list.add(@todo3)
    end

    def test_to_a
        assert_equal(@todos, @list.to_a)
    end

    def test_size
        assert_equal(3, @list.size)
    end

    def test_first
        assert_equal(@todo1 ,@list.first)
    end

    def test_last
        assert_equal(@todo3, @list.last)
    end

    def test_shift
        assert_equal(@todo1, @list.shift)
        assert_equal([@todo2, @todo3], @list.to_a)
        assert_equal(2, @list.size)
    end

    def test_pop
        assert_equal(@todo3, @list.pop)
        assert_equal(2, @list.size)
    end

    def test_done?
        @list.done!
        assert_equal(true, @list.done?)
        @todo1.undone!
        assert_equal(false, @list.done?)
    end

    def test_add_raise_error
        assert_raises(TypeError) { @list << "hi" }
        assert_raises(TypeError) { @list.add(1) }
    end 

    def test_shovel_add
        @list << (Todo.new("test"))
        assert_equal(4, @list.size)
    end

    def test_item_at
        assert_raises(IndexError) { 
            @list.item_at(6)
        }
    end

    def mark_done_at
        assert_raises(IndexError) { 
            @list.mark_done_at(6)
        }
        @item1.done! 
        assert_equal(true, @list[0].done?)
    end

    def mark_undone_at
        assert_raises(IndexError) { 
            @list.mark_undone_at(6)
        }
        @item1.undone! 
        assert_equal(false, @list[0].done?)
    end

    def done!
        @list.done!
        assert_equal(true, @list.done?)
    end

    def remove_at
        assert_raises(IndexError, @list.remove_at(5))
        assert_equal(@item2, @list.remove_at(1))
    end

    def test_to_s
        output = <<~OUTPUT.chomp
        ---- Today's Todos ----
        [ ] Buy milk
        [ ] Clean room
        [ ] Go to gym
        OUTPUT
      
        assert_equal(output, @list.to_s)
      end

    
     
    def test_to_s_done  
        @todo1.done!
        output = <<~OUTPUT.chomp
        ---- Today's Todos ----
        [X] Buy milk
        [ ] Clean room
        [ ] Go to gym
        OUTPUT
      
        assert_equal(output, @list.to_s)
    end

    def test_to_s_all_done  
        @list.mark_all_done
        output = <<~OUTPUT.chomp
        ---- Today's Todos ----
        [X] Buy milk
        [X] Clean room
        [X] Go to gym
        OUTPUT
      
        assert_equal(output, @list.to_s)
    end

    def test_each_iterate
        count = 0
        @list.each{count += 1}
        assert_equal(@list.size, count )
    end

    def test_each_return_value
        assert_equal(@list, @list.each{'hi'})
    end

    def select
        @item1.done!

        assert_equal(@item1, @list.select{|i| i.done?})
    end
end

