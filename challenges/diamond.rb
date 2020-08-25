# Diamond
# The diamond exercise takes as its input a letter, and outputs
# it in a diamond shape. Given a letter, it prints a diamond
# starting with 'A', with the supplied letter at the widest
# point.

# Requirements
# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical
# letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.
# Examples
# Diamond for letter 'A':

# A
# Diamond for letter 'C':

#   A
#  B B
# C   C
#  B B
#   A
# Diamond for letter 'E':

#     A
#    B B
#   C   C
#  D     D
# E       E
#  D     D
#   C   C
#    B B
#     A

# Problem breakdown: class Diamond =============
# #make_diamond(String letter) Observations: Middle row has
# letter, followed by n - 1 spaces where n is the ordinal number
# of the letter in the alphabet, followed again by letter. Above
# and below letter are each letter before letter until the
# beginning of the alphabet. All letters have n - 1 spaces
# between them except A, which is a single letter. All lines are
# centered in width spaces, where width is the nth odd number
# above 0 (n * 2 - 1).
# Approach: Initialize two empty arrays, one for the
# first half of the triangle, and another for the second half of
# the triangle, to contain the line strings.  Determine ordinal
# number of letter in alphabet Center an A in n + 1 spaces, push
# onto end of first array, and shift onto beginning of second
# array. For each letter from B up to and including input letter,
# push and shift, onto the respective arrays, the appropriate
# line, as detailed in observations above.

class Diamond
  def self.make_diamond(input_letter)
    width = (('A'..'Z').to_a.index(input_letter) + 1) * 2 - 1
    top_half = []
    bottom_half = []
    spaces = 1
    ('A'..input_letter).each do |letter|
      if letter == 'A'
        line = letter.center(width)
      else
        line = (letter + (' ' * (spaces)) + letter)
                 .center(width)
        spaces += 2
      end
      top_half.push line
      # Don't repeat middle line
      bottom_half.unshift line unless letter == input_letter
    end
    (top_half + bottom_half).join("\n") + "\n"
  end


end
