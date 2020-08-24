# Simple Linked List
# Write a simple linked list implementation that uses Elements
# and a List.

# The linked list is a fundamental data structure in computer
# science, often used in the implementation of other data
# structures.

# The simplest kind of linked list is a singly linked list. Each
# element in the list contains data and a "next" field pointing
# to the next element in the list of elements. This variant of
# linked lists is often used to represent sequences or push-down
# stacks (also called a LIFO stack; Last In, First Out).

# Lets create a singly linked list to contain the range (1..10),
# and provide functions to reverse a linked list and convert to
# and from arrays.

# Problem breakdown
# class Element
# =============
# #initialize(datum)
# create new object with @datum, @next and @tail instance variables
# #tail?
# return true if @next is nil
# #next
# attr accessor to @next, which is a reference to next node
# ======================
# class SimpleLinkedList
# ======================
# #initialize
# create new list object, to contain elements
# #empty
# returns true if list contains no elements
# #push
# adds element to end of list
# #size
# returns size of list
# #peek
# Returns datum of last element of list
# #head
# returns last element of list
# #pop
# pops element of end of list; returns datum
# #from_a(Object) (class method)
# Create list from object, which will be array or nil
# #to_a
# Convert list to array

class SimpleLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    array&.reverse&.each do |datum|
      list.push(datum)
    end
    list
  end

  def to_a
    array = []
    array << pop until empty?
    array
  end

  def reverse
    new_list = SimpleLinkedList.new
    new_list.push(pop) until empty?
    new_list
  end

  def size
    count = 0
    walker = @head
    while walker
      count += 1
      walker = walker.next
    end
    count
  end

  def empty?
    head.nil?
  end

  def push(datum)
    new_element = Element.new(datum, @head)
    @head = new_element
  end

  def pop
    popped = @head.datum
    @head = @head.next
    popped
  end

  def peek
    @head.datum if !empty?
  end
end

class Element
  attr_accessor :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end
