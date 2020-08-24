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
  def initialize(list = [])
    @list = []
    unless list.empty? || list.nil?
      list.reverse.each do |datum|
        push(datum)
      end
    end
  end

  def self.from_a(object)
    if object.nil? || object.empty?
      new
    else
      new(object)
    end
  end

  def to_a
    @list.map { |element| element.datum }.reverse
  end

  def reverse
    self.class.new(self.to_a.reverse)
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(datum)
    new_element = Element.new(datum)
    new_element.next = head unless empty?
    @list << new_element
  end

  def pop
    @list.pop.datum
  end

  def peek
    empty? ? nil : head.datum
  end

  def head
    empty? ? nil : @list.last
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
