# Nth Prime
# Write a program that can tell you what the nth prime is.

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.

# Do not use Ruby's Prime class nor any of the prime-number
# testing methods in the Integerbiden class. For an algorithm to
# determine whether a number is prime, check out this article.

# class:
# Prime
# class methods:
# nth(n)
# Return the nth prime number
# Approach: Create an array for prime numbers and a set for
# multiples of those primes. Add 2 to the array of prime
# numbers. Loop n times (where n is the nth prime number). At
# each iteration, the next prime number will be the the next
# Integer not contained in the array of primes or the set of
# multiples. (Subloop here, adding one each time to the last
# prime). Once next prime is found, multiply each number in the
# prime array by (prime array size - number index) and add each
# product to the multiples array.

# --Apparently no instance methods--
# Maybe better to use module

# Approach two: Keep array of primes. At each new candidate,
# check whether it is a multiple of the previous primes

module Prime
  def self.nth(n)
    raise ArgumentError if n == 0
    primes = [2]
    (n-1).times do
      primes << determine_next_prime(primes)
    end

    primes.last
  end

  def self.determine_next_prime(primes)
    candidate = primes.last + 1
    loop do
      return candidate unless multiple_of_prime?(primes, candidate)
      candidate += 1
    end
  end

  def self.multiple_of_prime?(primes, candidate)
    short_list = primes.take_while do |prime|
      prime**2 <= candidate
    end
    p short_list
    short_list.any? { |prime| (candidate % prime).zero? }
  end
end
