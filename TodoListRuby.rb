# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
    DONE_MARKER = 'X'
    UNDONE_MARKER = ' '
  
    attr_accessor :title, :description, :done
  
    def initialize(title, description='')
      @title = title
      @description = description
      @done = false
    end
  
    def done!
      self.done = true
    end
  
    def done?
      done
    end
  
    def undone!
      self.done = false
    end
  
    def to_s
      "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
    end
  end



# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
    attr_accessor :title
  
    def initialize(title)
      @title = title
      @todos = []
    end
  
    def add(newItem)
        (newItem.class == Todo) ? (@todos.push(newItem)) : (raise TypeError.new("Can only add Todo objects"))
    end
  
    def size
        @todos.length
    end

    def first
        @todos.first
    end

    def last
        @todos.last
    end

    def to_a
        @todos.clone
    end

    def item_at(index)
        @todos.fetch(index)
    end

    def mark_done_at(index)
        @todos.fetch(index).done!
    end

    def mark_undone_at(index)
        @todos.fetch(index).undone!
    end

    def done?
      @todos.all? {|l| l.done?}
    end

    def done!
        @todos.each {|t| t.done!}
    end

    def shift
        @todos.shift
    end

    def pop
        @todos.pop
    end

    def remove_at(index)
        @todos.delete(@todos.fetch(index))
    end

    def to_s
        p "---- #{@title} ---- "
        @todos.each {|t| p t.to_s}
    end

    def find_by_title(title)
      select {|item| item.title == title}.first
    end

    def all_done
      select {|item| item.done?}
    end

    def all_not_done
      select {|item| !item.done?}
    end

    def mark_done(title)
      find_by_title(title) && find_by_title(title).done!
    end 

    def mark_all_done
      each {|item| item.done!}
    end

    def mark_all_undone
      each {|item| item.undone!}
    end

    def each
      @todos.each do |todo|
        yield(todo)
      end
      self
    end

    def select
      results = TodoList.new(title);

      each do |todo|
        results.add(todo) if yield(todo)
      end
      results
    end
  end


  todo1 = Todo.new("Buy milk")
  todo2 = Todo.new("Clean room")
  todo3 = Todo.new("Go to gym")
  
  list = TodoList.new("Today's Todos")
  list.add(todo1)
  list.add(todo2)
  list.add(todo3)
  
  todo1.done!
  
  # puts list.find_by_title("Buy milk")
  puts list.all_done

  # results = list.select { |todo| todo.done? }    # you need to implement this method
  
  # puts results.inspect