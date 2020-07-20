class Todo
  DONE_MARKER = 'X'.freeze
  UNDONE_MARKER = ' '.freeze

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

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  include Enumerable

  attr_accessor :title

  def initialize(title)
    @todos = []
    @title = title
  end

  def each
    for e in todos
      yield(e)
    end
    self
  end

  def add(todo)
    if todo.class == Todo
      todos << todo
    else
      raise TypeError.new("Can only add Todo objects")
    end
    todos
  end

  alias << add

  def append(other_todo_list)
    todos + other_todo_list
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def done?
    todos.all? { |todo| todo.done }
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def item_at(index)
    todos[index]
  end

  def mark_done_at(index)
    todos[index].done!
  end

  def mark_undone_at(index)
    todos[index].undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete[index]
  end

  def select
    selected = []
    todos.each do |todo| 
      selected << todo if yield(todo)
    end
    TodoList.new('selected').append(selected)
  end

  def empty?
    todos.empty?
  end

  def find_by_title(title)
    matching_todos = todos.select { |todo| todo.title == title } 
    
    matching_todos.empty? ? nil : matching_todos[0]
  end

  def all_done
    matching_todos = todos.select { |todo| todo.done? }

    matching_todos.empty? ? nil : TodoList.new('All done')
                                   .append(matching_todos)
  end

  def all_not_done
    matching_todos = todos.reject { |todo| todo.done? }

    matching_todos.empty? ? nil : TodoList.new('None done')
                                   .append(matching_todos)
  end

  def mark_done(title)
    matching_todos = todos.select { |todo| todo.title == title } 
    
    matching_todos.empty? ? nil : matching_todos[0].done!
  end

  def mark_all_done
    todos.each { |todo| todo.done! }
  end

  def mark_all_undone
    todos.each { |todo| todo.undone! }
  end

  def to_s
    todos.reduce('') { |accum, todo| accum + todo.to_s + "\n" }
  end

  protected

  attr_reader :todos
end
# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
list.size                       # returns 3

# first
list.first                      # returns todo1, which is the first item in the list

# last
list.last                       # returns todo3, which is the last item in the list

#to_a
list.to_a                      # returns an array of all items in the list

#done?
list.done?                     # returns true if all todos in the list are done, otherwise false

# # ---- Retrieving an item in the list ----

# # item_at
# list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# # done!
# list.done!                      # marks all items as done

# # ---- Deleting from the list -----

# # shift
# list.shift                      # removes and returns the first item in list

# # pop
# list.pop                        # removes and returns the last item in list

# # remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym
