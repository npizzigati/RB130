# Sum of Multiples
# Write a program that, given a number, can find the sum of all
# the multiples of particular numbers up to but not including
# that number.

# If we list all the natural numbers up to but not including 20
# that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12,
# 15, and 18. The sum of these multiples is 78.

# Write a program that can find the sum of the multiples of a
# given set of numbers. If no set of numbers is given, default to
# 3 and 5.

# Problem notes
=begin

Input: constructor: 0 or more Integers; #to: Integer
Output: Integer

Requirements:
Explicit:
- The output will be the sum of all multiples of each of the
  integers passed into the constructor up to (not including) the
  integer passed in to the #to method
- If the constructor is called without arguments, use 3 and 5 as
  the default arguments
Implicit:
- Only integers may be entered as arguments
- Numbers must be positive
= It is not necessary to error check arguments

Approach:
Iterate over each integer in range from min argument to limit
(excluding limit). If i is a multiple of any of the arguments,
add to a list. At end of iteration, take sum of range.

=end
module Calculations
  def self.sum_multiples(factors, limit)
    multiples = []

    factors.min.upto(limit - 1) do |index|
      multiples << index if self.is_multiple?(index, factors)
    end

    multiples.sum
  end

  def self.is_multiple?(number, factors)
    factors.each do |factor|
      return true if number % factor == 0
    end

    false
  end
end

class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def self.to(limit)
    Calculations.sum_multiples([3, 5], limit)
  end

  def to(limit)
    Calculations.sum_multiples(@factors, limit)
  end
end
