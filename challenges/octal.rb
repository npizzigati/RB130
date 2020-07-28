# Octal
# Implement octal to decimal conversion. Given an octal input
# string, your program should produce a decimal output.

# Note:

# Implement the conversion yourself. Do not use something else to
# perform the conversion for you. Treat invalid input as octal 0.

# About Octal (Base-8):

# Decimal is a base-10 system.

# A number 233 in base 10 notation can be understood as a linear
# combination of powers of 10:

# The rightmost digit gets multiplied by 100 = 1
# The next number gets multiplied by 101 = 10
# ...
# The n*th number gets multiplied by 10n-1*.
# All these values are summed.
# So:

# input: String
# output: Integer

# Specifications:
# Explicit:
# - Input is a string representation of an octal number
# - Output is an Integer in decimal format
# - Invalid input to be treated as octal 0
# Implicit:
# -

# Approach: Convert input parameter to string to check
# validity. If not valid, return 0. If negative, set negative
# flag, and remove negative symbol. Convert do Integer. Call
# #digits on input parameter, # which will give us digits in
# reversed order. Multiply
# each digit by (8^(digit index)) which is 8 to the nth
# power, where n is the place of the digit. Return the sum of the
# products.

class Octal
  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    return 0 if not_a_number?
    
    digits = @octal_string.to_i.abs.digits
    result = 0
    digits.each_with_index do |digit, index|
      break if digit > 7

      result += digit * (8**index)
    end
    negative? ? -result : result
  end

  def not_a_number?
    @octal_string !~ /^-?\d+$/
  end

  def negative?
    @octal_string.start_with? == '-'
  end
end

