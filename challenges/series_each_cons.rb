# Series
# Write a program that will take a string of digits and give you
# all the possible consecutive number series of length n in that
# string.

# For example, the string "01234" has the following 3-digit
# series:

# - 012
# - 123
# - 234
# And the following 4-digit series:

# - 0123
# - 1234
# And if you ask for a 6-digit series from a 5-digit string, you
# deserve whatever you get.

# input: String of digits
# output: array of arrays of digits.

# Problem:
# Explicit requirements:
# - Output must be a list of all possible
# consecutive series that can be created from original list.
# Implicit requirements:
# - Provide message if user tries to get n + 1 size strings from
# an input string of n length.

# Approach
# Use each_cons



class Series
  def initialize(string)
    @string = string
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > @string.size
    @string.chars.map(&:to_i).each_cons(slice_size).to_a
  end
end

