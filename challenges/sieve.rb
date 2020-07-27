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

# Approach: See given algorithm

class Sieve
  def initialize(limit)
    @limit = limit
    @non_primes = []
    @primes = [2]
  end

  def primes
    catch :stop do
      loop do
        mark_multiples_as_nonprimes
        determine_next_prime
      end
    end
    @primes
  end

  def mark_multiples_as_nonprimes
    factor = 2
    loop do
      non_prime = @primes.last * factor
      puts "@primes.last: #{@primes.last}"
      puts "factor: #{factor}"
      puts "non_prime: #{non_prime}"
      break if non_prime > @limit
      @non_primes << non_prime
      factor += 1
    end
  end

  def determine_next_prime
    count = 0
    loop do
      count += 1
      candidate = @primes.last + count
      throw :stop if candidate > @limit
      next if @non_primes.include? candidate
      @primes << candidate
      puts "#{candidate} added to primes"
      break
    end
  end
end
