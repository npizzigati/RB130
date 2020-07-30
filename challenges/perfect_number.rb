# Perfect Number
# The Greek mathematician Nicomachus devised a classification
# scheme for natural numbers, identifying each as belonging
# uniquely to the categories of abundant, perfect, or
# deficient. A perfect number equals the sum of its positive
# divisors — the pairs of numbers whose product yields the target
# number, excluding the number itself. This sum is known as the
# Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number
# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 =
# 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus
# classification.
# Write a program that can tell if a number is perfect, abundant
# or deficient.

# Problem breakdown
# Input: Integer
# Output: String

# Requirements:
# Explicit:
# 1 Output will be "perfect," "abundant," or "deficient"
#   depending on whether the sum of factors is equal to, greater
#   than or less than the number, respectively.
# Implicit:
# 1 (Determined from tests) Raise a StandardError if number is
#   negative.
# 2 Method to find perfect number is a class method. No objects
#   are instantiated from class.
# Questions:
# 1 What if number is zero. (Is 0 a perfect number? No -- it is
#   not a natural number and therefore is not perfect.) Also
#   return error.

# Approach: Calculate factors (iterate from 1 to number/2; if
# number % i == 0, i is a factor). Sum factors to determine
# result and return result.

class PerfectNumber
  def self.classify(number)
    raise StandardError, 'Must be natural number' if invalid?(number)

    factors = calculate_factors(number)

    case factors.sum
    when number
      "perfect"
    when ((number + 1)...)
      "abundant"
    when (1...number)
      "deficient"
    end
  end

  def self.calculate_factors(number)
    factors = []
    1.upto(number / 2) do |i|
      factors << i if (number % i).zero?
    end
    factors
  end

  def self.invalid?(number)
    number < 1 || number.to_i != number
  end
end
