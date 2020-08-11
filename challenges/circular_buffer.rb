# Circular Buffer
# A circular buffer, cyclic buffer or ring buffer is a data
# structure that uses a single, fixed-size buffer as if it were
# connected end-to-end.

# A circular buffer first starts empty and of some predefined
# length. For example, this is an empty 7-element buffer:

# [ ][ ][ ][ ][ ][ ][ ]
# Assume that a 1 is written into the middle of the buffer (exact
# starting location does not matter in a circular buffer):

# [ ][ ][ ][1][ ][ ][ ]
# Then assume that two more elements are added, or written to the
# buffer — 2 & 3 — which get appended after the 1:

# [ ][ ][ ][1][2][3][ ]
# If two elements are then read, or removed from the buffer, the
# oldest values inside the buffer are removed. The two elements
# removed, in this case, are 1 & 2, leaving the buffer with just
# a 3:

# [ ][ ][ ][ ][ ][3][ ]
# If the buffer has 7 elements then it is completely full:

# [6][7][8][9][3][4][5]
# When the buffer is full an error will be raised, alerting the
# client that further writes are blocked until a slot becomes
# free.

# The client can opt to overwrite the oldest data with a forced
# write. In this case, two more elements — A & B — are added and
# they overwrite the 3 & 4:

# [6][7][8][9][A][B][5]
# Finally, if two elements are now removed then what would be
# returned is not 3 & 4 but 5 & 6 because A & B overwrote the 3 &
# the 4 yielding the buffer with:

# [ ][7][8][9][A][B][ ]

# Problem breakdown:
# Classes: CircularBufferTest
# Class Methods:
# new(Integer n):
# - Instantiate a buffer with n number of fields
# Instance Methods:
# read()
# - Return the oldest element in the buffer
# write(String item)
# - Add item to the next available space in the buffer
# - If buffer is full, raise an error
# write!(String)
# - Add item to next available space in buffer, or overwrite
#   oldest item if no space available

# Method breakdowns
# CircularBufferTest.new(Integer n)
# Input: n is the number of spaces in the buffer
# Output: an Array and Integer size, respectively, in instance
# variables

# read()
# shift Array and output shift return value
# raise error if buffer empty before shift attempt

# write()
# push new item if buffer.size < size
# else, raise BufferFullException

# write!()
# push new item and shift

# clear()
# (Only appears in test suite (not in instructions))
# Appears to erase all elements from buffer
# Implement by setting array to []

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @buffer = []
    @size = size
  end

  def read
    raise BufferEmptyException if buffer.empty?

    buffer.shift
  end

  def write(item)
    raise BufferFullException if buffer.size == size

    return if item == nil

    buffer << item
  end

  def write!(item)
    return if item == nil

    buffer.push(item)
    buffer.shift if buffer.size > size
  end

  def clear
    self.buffer = []
  end

  private

  attr_accessor :buffer
  attr_reader :size
end
