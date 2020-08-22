# Run-length Encoding
# Implement run-length encoding and decoding.

# Run-length encoding (RLE) is a simple form of data compression,
# where runs (consecutive data elements) are replaced by just one
# data value and count.

# For example we can represent the original 53 characters with
# only 13.

# "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB" ->
# "12WB12W3B24WB"
# RLE allows the original data to be perfectly reconstructed from
# the compressed data, which makes it a lossless data
# compression.

# "AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"

# Problem breakdown
# class RunLengthEncoding
# =======================
# #encode(String input)
# return RLE encoded string of input
# Approach: Convert string to array and call uniq on that.
# For each character in the array, remove the characters from the
# front of the original string and count them (maybe count using
# #match and then #count, and then remove using #slice)
# -----------------------
# #decode
# Extract numbers and letters from string and store in separate
# arrays. Iterate over numbers. For each number, shift one letter
# off the string array, multiply it by the number and add it a
# new string, to be returned at the end of the iteration.

# class RunLengthEncoding
#   def self.encode(input)
#     single_chars = input.squeeze.chars
#     encoded_string = ''
#     single_chars.each do |char|
#       match_size = input.match(/^#{char}+/)[0].size
#       encoded_string << match_size.to_s if match_size > 1
#       encoded_string << char
#       input = input[match_size..-1]
#     end
#     encoded_string
#   end

#   def self.decode(input)
#     input = add_implicit_1(input)
#     print "implicit1: "
#     p input
#     counts = input.scan(/\d+/)
#     letters = input.scan(/\D+/)
#     decoded_string = ''
#     counts.each do |count|
#       decoded_string << (letters.shift * count.to_i)
#     end
#     decoded_string
#   end

#   def self.add_implicit_1(input)
#     # Insert 1 at beginning if implicit
#     input = '1' + input unless input.start_with?(/\d+/)
#     # Insert 1 between all non-same contiguous letters
#     input.gsub(/(\D)(?!\1)([\D])/, '\11\2')
#   end
# end

# Simple approach with iteration
# #encode(String input)
# Approach:
# Initiatlize counts and non_digits arrays
# Shift 1st char from array into letters array and add one to
# count temp variable.
# Shift off characters while the same as first and add 1 each
# time to count temp variable.
# When characters.first is not the same as letters array last
# element, add count temp variable value to counts array
# Repeat loop until characters.empty?

# #decode(String input)
# Approach:
# Iterate over characters.
# If character is a non-digit, add a '1' to encoded string, then
# shift off character into letters array.
# Else, shift off digit characters into a temp digit variable,
# then add this to encoded string. Then add next letter into
# encoded string.

class RunLengthEncoding
  def self.encode(input)
    characters = input.chars
    counts = []
    letters = []
    cnt = 0
    until characters.empty?
      letters << characters.shift
      cnt += 1
      while characters.first == letters.last
        characters.shift
        cnt += 1
      end
      counts << cnt
      cnt = 0
    end

    build_encoded_string(counts, letters)
  end

  def self.build_encoded_string(counts, letters)
    counts.zip(letters).flatten.join.gsub(/1(?!\d)/, '')
  end

  def self.decode(input)
    characters = input.chars
    counts = []
    letters = []
    temp_count = ''
    until characters.empty?
      if characters.first =~ /\D/
        counts << 1
        letters << characters.shift
      else
        temp_count << characters.shift until characters.first =~ /\D/
        counts << temp_count.to_i
        letters << characters.shift
      end
      temp_count = ''
    end
    build_decoded_string(counts, letters)
  end

  def self.build_decoded_string(counts, letters)
    decoded_string = ''
    counts.each do |count|
      decoded_string << (letters.shift * count)
    end
    decoded_string
  end
end
