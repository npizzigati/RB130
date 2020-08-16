# Palindrome Products
# Write a program that can detect palindrome products in a given
# range.

# A palindromic number reads the same both ways. The largest
# palindrome made from the product of two 2-digit numbers (range
# 10 ~ 99) is 9009 = 91 x 99.

# Classes:
# Palindromes
# Methods:
# initialize(Integer max_factor[, Integer min_factor]):
# - Default value for min_factor is 1

# generate()
# Find factors that generate palindromes
# - Find all possible combinations of pairs of numbers in
#   range. Keep factor pair if product is a palindrome.

# largest()
# Return object with two new methods: value() and factors()
# Instance variable should be @largest_palindrome

# smallest()
# Return object with two new methods: value() and factors()
# Instance variable should be @smallest_palindrome

# value()
# Return integer value of product

# factors()
# Return factors of product

# private methods:
# palindrome(string)
# Approach: reverse is the same as forwards

Largest = Struct.new(:value, :factors)
Smallest = Struct.new(:value, :factors)

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @range = min_factor..max_factor
    @palindrome_products = Hash.new { |hash, key| hash[key] = []}
  end

  def generate
    numbers = @range.to_a
    candidate_combos = numbers.combination(2) + build_twins(numbers)
    candidate_combos.each do |combo|
      product = combo.first * combo.last
      @palindrome_products[product] << combo if palindrome?(product)
    end
  end

  def largest
    largest_palindrome = [@palindrome_products.max].to_h
    Largest.new(largest_palindrome.keys.first,
                largest_palindrome.values.first)
  end

  def smallest
    smallest_palindrome = [@palindrome_products.min].to_h
    Smallest.new(smallest_palindrome.keys.first,
                 smallest_palindrome.values.first)
  end

  private

  def palindrome?(product)
    product_string = product.to_s
    product_string == product_string.reverse
  end

  def build_twins(numbers)
    numbers.map { |number| [number, number] }
  end

end
