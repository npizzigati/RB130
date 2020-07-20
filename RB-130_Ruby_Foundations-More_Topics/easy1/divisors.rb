# Divisors
# Write a method that returns a list of all of the divisors of
# the positive integer passed in as an argument. The return value
# can be in any sequence you wish.

# Examples

# Algorithm: Iterate from 1 to num/2. If num is divisible by
# index, add index to results array.

def divisors(num)
  results = []

  (1..(num / 2)).each do |idx|
    results << idx if evenly_divisible?(num, idx)
  end

  results << num
end

def evenly_divisible?(num, idx)
  num % idx == 0
end

puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
# puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# Further exploration

# How fast can you make your solution go? How big of a number can
# you quickly reduce to its divisors? Can you make
# divisors(999962000357) return almost instantly? (The divisors
# are [1, 999979, 999983, 999962000357].) Hint: half of the
# divisors gives you the other half.

# Algorithm: Iterate from 1 to number. At each iteration, take
# the divmod of the original number by the iterator index. If the
# remainder is zero, store the divisor and the quotient as
# factors. In all cases, store the divisor and quotient in a
# cache of used values, to be checked before each divmod so as
# not to repeat divisors.

def divisors2(number)
  used = Set.new
  factors = Set.new
  1.upto(number / 2).each do |divisor|
    if used.include?(divisor)
      next
    end
    quotient, remainder = number.divmod(divisor)
    if remainder == 0
      factors << divisor << quotient
    end
    used << quotient
  end
  factors << number
end

def divisors3(number)
  factors = Set.new
  1.upto(number / 2).each do |divisor|
    quotient, remainder = number.divmod(divisor)
    if remainder == 0
      factors << divisor << quotient
    end
  end
  factors << number
end

def divisors4(number)
  factors = Set.new
  1.upto(number / 2).each do |divisor|
    if number % divisor == 0
      factors << divisor
    end
  end
  factors << number
end

# This is the good one
def divisors5(number)
  quotients = Set.new
  factors = Set.new
  1.upto(number / 2).each do |divisor|
    break if quotients.include? divisor
    quotient, remainder = number.divmod(divisor)
    if remainder == 0
      factors << divisor << quotient
    end
    quotients << quotient
  end
  factors << number
end

def benchmark(operation)
  start_time = Time.now
  yield
  puts operation + ": " + (Time.now - start_time)
end

puts divisors5(999962000357)
