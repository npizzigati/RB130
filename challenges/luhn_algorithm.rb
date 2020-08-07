# Luhn Algorithm
# The Luhn formula is a simple checksum formula used to validate
# a variety of identification numbers, such as credit card
# numbers and Canadian Social Insurance Numbers.

# The formula verifies a number against its included check digit,
# which is usually appended to a partial number to generate the
# full number. This number must pass the following test:

# Counting from rightmost digit (which is the check digit) and
# moving left, double the value of every second digit.
# For any digits that thus become 10 or more, subtract 9 from the
# result.
# 1111 becomes 2121.
# 8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).
# Add all these digits together.
# 1111 becomes 2121 sums as 2+1+2+1 to give a checksum of 6.
# 8763 becomes 7733, and 7+7+3+3 is 20.
# If the total (the checksum) ends in 0 (put another way, if the
# total modulo 10 is congruent to 0), then the number is valid
# according to the Luhn formula; else it is not valid. So, 1111
# is not valid (as shown above, it comes out to 6), while 8763 is
# valid (as shown above, it comes out to 20).

# Write a program that, given a number

# Can check if it is valid per the Luhn formula. This should
# treat, for example, "2323 2005 7766 3554" as valid.
# Can return the checksum, or the remainder from using the Luhn
# method.
# Can add a check digit to make the number valid per the Luhn
# formula and return the original number plus that digit. This
# should give "2323 2005 7766 3554" in response to "2323 2005
# 7766 355".
# About Checksums:

# A checksum has to do with error-detection. There are a number
# of different ways in which a checksum could be calculated.

# When transmitting data, you might also send along a checksum
# that says how many bytes of data are being sent. That means
# that when the data arrives on the other side, you can count the
# bytes and compare it to the checksum. If these are different,
# then the data has been garbled in transmission.

# In the Luhn problem the final digit acts as a sanity check for
# all the prior digits. Running those prior digits through a
# particular algorithm should give you that final digit.

# It doesn't actually tell you if it's a real credit card number,
# only that it's a plausible one. It's the same thing with the
# bytes that get transmitted -- you could have the right number
# of bytes and still have a garbled message. So checksums are a
# simple sanity-check, not a real in-depth verification of the
# authenticity of some data. It's often a cheap first pass, and
# can be used to quickly discard obviously invalid things.

# methods:
# constructor:
# input: Integer

# addends
# output: array<Integer>
# rules:
# Addends are each number multiplied by the weighting factor
# applied right to left (2x every second digit)
# Approach: call #digits on number; iterate over digits; for odd
# indices, multiply digit by two; for even indices do nothing; if
# product is greater than 10, subtract 9; reverse array and return

# checksum:
# output: Integer
# rules:
# sum of all addends

# valid?
# output: boolean
# returns true if checksum % 10 == 0

# create
# output: Integer
# returns check digit to make input number valid.
# Approach: Check whether original number is valid; if so, return
# that number. If not, recalculate addends based on weighting
# even indices; add final digit according to formula c.d. = 10 -
# checksum % 10

class Luhn
  WEIGHT = 2.freeze
  ADJUSTMENT = 9.freeze

  def initialize(number)
    @number = number
  end

  def addends
    addends = @number.digits.map.with_index do |digit, index|
      if index.odd?
        digit *= WEIGHT
        digit -= ADJUSTMENT if digit > 10
      end
      digit
    end
    addends.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(number)
    0.upto(9) do |check_digit|
      candidate = number * 10 + check_digit
      return candidate if Luhn.new(candidate).valid?
    end
  end
end
