# Write a program that, given a word, computes the scrabble score
# for that word.

# Letter Values
# You'll need these:

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# Examples
# "cabbage" should be scored as worth 14 points:

# 3 points for C
# 1 point for A, twice
# 3 points for B, twice
# 2 points for G
# 1 point for E
# And to total:

# 3 + 2*1 + 2*3 + 2 + 1
# = 3 + 2 + 6 + 3
# = 5 + 9
# = 14

# Input: String
# Output: Integer
# 
# Requirements:
# Explicit
# Input will be a single word
# Output will be the scrabble score of input word
# Scrabble score is calculated according to the rules
# Implicit
# Scoring is case insensitive
# Input may be nil, blank or special whitespace characters
# - they are (scored as nil)
# Data structure
# Hash for letters(key) and scores

# Questions:
# - What if multiple words are passed in?
# - What if a non-String is passed in?

# Approach:
# Create hash with scores, with one element for each letter, if
# possible. Iterate through input string, after removing/error
# checking for nil and whitespace, and add score to a results
# array. Sum results array and return.
# Approach 2: Count the occurrences of each letter in word using String#count

SCORES = { 'A' => 1,
           'E' => 1,
           'I' => 1,
           'O' => 1,
           'U' => 1,
           'L' => 1,
           'N' => 1,
           'R' => 1,
           'S' => 1,
           'T' => 1,
           'D' => 2,
           'G' => 2,
           'B' => 3,
           'C' => 3,
           'M' => 3,
           'P' => 3,
           'F' => 4,
           'H' => 4,
           'V' => 4,
           'W' => 4,
           'Y' => 4,
           'K' => 5,
           'J' => 8,
           'X' => 8,
           'Q' => 10,
           'Z' => 10 }

class Scrabble
  def initialize(word)
    @word = remove_whitespace(word) if !word.nil?
  end

  def self.score(word)
    self.new(word).score
  end

  def remove_whitespace(word)
    word.gsub(/\s/, '')
  end

  def score
    return 0 if @word.nil? || @word.empty?
    points = 0
    @word.upcase.chars.each { |char| points += SCORES[char] }
    points
  end
end
