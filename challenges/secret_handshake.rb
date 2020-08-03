# Secret Handshake
# Write a program that will take a decimal number, and convert it
# to the appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand
# binary, and those who don't. You and your fellow cohort of
# those in the "know" when it comes to binary decide to come up
# with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump


# 10000 = Reverse the order of the operations in the secret
# handshake.
# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]
# The program should consider strings specifying an invalid
# binary as the value 0.

# input: integer or string
# output: list of 1 more strings
# Requirements
# Explicit
# input is decimal of a binary number. Output is the secret
# handshake.

# Approach
# Convert input to integer
# Loop over handshake table key (ordered from highest to lowest)
# At each iteration:
#  if input == key, add table value to results array and return
#  if input > key, add value to results array, and subtract key
#    from input
#  if input < key, do nothing

# Version 2, using bit mask

HANDSHAKES = { 0b00001 => 'wink',
               0b00010 => 'double blink',
               0b00100 => 'close your eyes',
               0b01000 => 'jump' }
REVERSE =      0b10000

class SecretHandshake
  def initialize(input)
    @number = input.to_i
  end

  def commands
    results = []
    HANDSHAKES.each do |key, value|
      results << value if key & @number > 0
    end

    REVERSE & @number > 0 ? results.reverse : results
  end
end
