# Sieve of Eratosthenes
# Write a program that uses the Sieve of Eratosthenes to find all
# the primes from 2 up to a given number.

# The Sieve of Eratosthenes is a simple, ancient algorithm for
# finding all prime numbers up to any given limit. It does so by
# iteratively marking as composite (i.e. not prime) the multiples
# of each prime, starting with the multiples of 2.

# Create your range, starting at two and continuing up to and
# including the given limit. (i.e. [2, limit]).

# The algorithm consists of repeating the following over and
# over:

# take the next available unmarked number in your list (it is
# prime)

# mark all the multiples of that number (they are not prime)

# Repeat until you have processed each number in your range. When
# the algorithm terminates, all the numbers in the list that have
# not been marked are prime. The wikipedia article has a useful
# graphic that explains the algorithm.

# Notice that this is a very specific algorithm, and the tests
# don't check that you've implemented the algorithm, only that
# you've come up with the correct list of primes.

# Input: Natural number (in string form)
# Output: Array of integers

# Requirements:
# Explicit:
# - Output will be a list of all prime numbers up to and including
# input limit
# - Must use explained algorithm

# Approach:
# 1 - Create an array of all numbers from 2 to limit.
# 2 - Delete numbers that are multiples of first element of array.
#     (select numbers that are not multiples)
# 3 - Select next number in array.
# 4 - Repeat step 2 until number whose multiple we are deleting is
# greater than limit

class Sieve
  def initialize(limit)
    @limit = limit
    @list = (2..limit).to_a
  end

  def primes
    return [] if @limit < 2
    base = 2
    loop do
      @list = @list.select { |element| element == base ||
                            element % base != 0 }
      next_index = @list.index(base) + 1
      break if next_index == @list.size
      base = @list[next_index]
    end
    @list
  end
end
