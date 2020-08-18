require 'pry'
# Write a program that computes Pascal's triangle up to a given
# number of rows.

# In Pascal's Triangle each number is computed by adding the
# numbers to the right and left of the current position in the
# previous row.

#     1
#    1 1
#   1 2 1
#  1 3 3 1
# 1 4 6 4 1
# # ... etc
#

# Classes:
# Triangle

# Methods:

# initialize(Integer height)
# Save height as instance variable

# rows()
# return array of arrays<Integer> representing triangle rows
# array object returned has a #last method which gives the last
# element in the array -- can I do this with a refinement?

# Approach to calculate rows:
# Recursively calculate each element as the sum of the elements
# to the left and right of it (indexes n -1 and n) of the
# previous row. If index n of current row is zero or last, assign
# element to 1;

# Iterative approach:
# Build an empty triangle:
# Create an empty triangle array.
# 1.upto(height).each |index| do:
# Push a new Array with (index) elements onto triangle
# array
# Height times do:
# Push a new array (row) onto triangle. Each element in this
# array will calculated as follows:
# - Initialize new row array to array of one more elements than
#   previous row, filled with all nils.
# - Iterate through elements. If index is 0 or last, assign
#   element to 1, otherwise assign it to previous_row[n-1] +
#   previous_row[n]

class Triangle
  def initialize(height)
    @height = height
    @triangle = build_empty_triangle(height)
    @triangle[0] = [1]
    fill_in_triangle
  end

  def rows
    @triangle
  end

  private

  def build_empty_triangle(height)
    triangle = []
    1.upto(height) do |row_size|
      triangle << Array.new(row_size)
    end
    triangle
  end

  def fill_in_triangle
    @triangle.each_cons(2) do |previous_row, current_row|
      fill_in_row(previous_row, current_row)
    end
  end

  def fill_in_row(previous_row, current_row)
    last_index = current_row.size - 1
    current_row.map!.with_index do |_, index|
      if index.zero? || index == last_index
        1
      else
        previous_row[index - 1] + previous_row[index]
      end
    end
  end


end
