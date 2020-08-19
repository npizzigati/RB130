# Crypto Square
# Implement the classic method for composing secret messages
# called a square code.

# The input is first normalized: The spaces and punctuation are
# removed from the English text and the message is down-cased.

# Then, the normalized characters are broken into rows. These
# rows can be regarded as forming a rectangle when printed with
# intervening newlines.

# For example, the sentence

# If man was meant to stay on the ground god would have given us
# roots

# is 54 characters long.

# Broken into 8-character columns, it yields 7 rows.

# Those 7 rows produce this rectangle when printed one per line:

# ifmanwas
# meanttos
# tayonthe
# groundgo
# dwouldha
# vegivenu
# sroots
# The coded message is obtained by reading down the columns going
# left to right. For example, the message above is coded as:

# imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau
# Write a program that, given an English text, outputs the
# encoded version of that text.

# The size of the square (number of columns) should be decided by
# the length of the message. If the message is a length that
# creates a perfect square (e.g. 4, 9, 16, 25, 36, etc), use that
# number of columns. If the message doesn't fit neatly into a
# square, choose the number of columns that corresponds to the
# smallest square that is larger than the number of characters in
# the message.

# For example, a message 4 characters long should use a 2 x 2
# square. A message that is 81 characters long would use a square
# that is 9 columns wide. A message between 5 and 8 characters
# long should use a rectangle 3 characters wide.

# Output the encoded text grouped by column.

# Approach:
# Classes:
# ------
# Crypto
# Methods:
# -------
# #initialize(String message)
# Store as an instance variable
# #normalize_plaintext
# Remove spaces/punctuation and downcase message
# #size
# Determine number of columns according to normalized plaintext
# and rules
# How?: take square root of normalized size and round up to next
# integer
# #plaintext_segments
# Return segments(cut off at column limit) as list
# #ciphertext
# Return encrypted text with no spaces
# How? Size times do |index|
#        plaintext_segments.each do |segment|
#          ciphertext << segment[index] || ''
# #normalize_ciphertext
# Return encrypted text with spaces according to columns

class Crypto
  attr_reader :message, :plaintext, :cipher_words, :size,
              :plaintext_segments
   

  def initialize(message)
    @message = message
    @plaintext = normalize_plaintext
    @size = calculate_size
    @plaintext_segments = build_plaintext_segments
    @cipher_words = build_cipher_words
  end

  def normalize_plaintext
    message.gsub(/[^[:alnum:]]/, '').downcase
  end

  def ciphertext
    cipher_words.join
  end

  def normalize_ciphertext
    cipher_words.join(' ')
  end

  def calculate_size
    Math.sqrt(plaintext.size).ceil
  end

  def build_plaintext_segments
    regular_segments = plaintext.scan(/.{#{size}}/)
    hang_size = plaintext.size - regular_segments.join.size
    regular_segments << plaintext[-hang_size..-1] unless hang_size.zero?
    regular_segments
  end

  def build_cipher_words
    cipher_words = []
    cipher_word = ''
    size.times do |index|
      plaintext_segments.each do |segment|
        cipher_word << (segment[index] || '')
      end
      cipher_words << cipher_word
      cipher_word = ''
    end
    cipher_words
  end
end
