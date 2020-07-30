# Write a program that given a phrase can count the occurrences
# of each word in that phrase.

# For example, if we count the words for the input "olly olly in
# come free", we should get:

# olly: 2
# in: 1
# come: 1
# free: 1

# Input: String
# Output: hash<String: Integer>

# Requirements:
# Explicit:
# - Output hash is the word counts of each of the strings in the
#   input string
# Implicit:
# - (from tests) Don't include punctuation in words or
#   counts
# - New lines may be included in input

# Approach:
# Remove punctuation(except apostrophes) and replace newlines
# with spaces. Split string on spaces. Count the occurrence of
# each word in array using #count.
# Approach 2:
# Replace newlines with spaces. Split string on spaces. Remove punctuaction from word
# boundaries. Count words in array using #count.

class Phrase
  def initialize(phrase)
    @phrase = MyString.new(phrase.downcase)
  end

  def word_count
    words = @phrase.remove_newlines.split(/[\s,]/)
    words.map! { |word| MyString.new(word).strip_punctuation }
    result = {}
    words.uniq.each do |word|
      result[word] = words.count(word) if word != ''
    end
    result
  end

  def remove_punctuation
  end

  class MyString < String
    def initialize(string)
      @string = string
    end

    def strip_punctuation
      @string.gsub(/^\W+|\W+$/, '')
    end

    def remove_newlines
      @string.gsub(/\n/, ' ')
    end
  end
end
