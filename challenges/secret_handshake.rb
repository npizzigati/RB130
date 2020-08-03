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

HANDSHAKE_TABLE = { 0b00001 => 'wink',
                    0b00010 => 'double blink',
                    0b00100 => 'close your eyes',
                    0b01000 => 'jump',
                    0b10000 => 'reverse' }

class SecretHandshake
  def initialize(input)
    @number = input.to_i
    @handshake_keys = HANDSHAKE_TABLE.keys.sort { |a, b| b <=> a }
  end

  def commands
    results = []
    @handshake_keys.each do |key|
      if key <= @number
        results.unshift HANDSHAKE_TABLE[key]
        break if key == @number
        @number -= key
      end
    end
    results[-1] == 'reverse' ? results[0..-2].reverse : results
  end
end
