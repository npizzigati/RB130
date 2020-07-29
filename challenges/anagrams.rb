# Anagrams
# Write a program that, given a word and a list of possible
# anagrams, selects the correct sublist that contains the
# anagrams of the word.

# For example, given the word "listen" and a list of candidates
# like "enlists" "google" "inlets" "banana" the program should
# return a list containing "inlets". Please read the test suite
# for exact rules of anagrams.

# input: One word string (in constructor); list of strings (in
# match method)
# output: Array of strings

# requirements:
# explicit:
# - Output will be an array of one or more of the words passed
#   into the match method that are anagrams of the original
#   word
# implicit:
# - (from test suite): Letters in words are not case sensitive
#
# Approach
#
# Convert the original word into an array. Iterate through the
# words (lowercased and converted into arrays) passed into the
# match method. If the word in question 1) is the same length,
# and 2) gives a blank array when subtracted from the original
# word, it is an anagram.
# **** The above approach is unsuccesful because the #- method
# **** will produce an empty array if each array has at least one
# **** of each of the same elements.
# New approach: Order arrays. Compare size and then compare using ==.
# Add condition that same words are not anagrams
# Challenge -- implement without using sort.
# Approach: Count letters in each word. Each word should have the
# same letters in the same quantities.

class Anagram
  def initialize(original_word)
    @original_word = original_word
    @converted_word = original_word.downcase
    @target_size = @converted_word.size
  end

  def match(candidates)
    results = []
    candidates.each do |candidate|
      if anagram?(candidate)
        results << candidate
      end
    end
    results
  end

  private

  def anagram?(candidate)
    return false if not_same_size?(candidate) || same_word?(candidate)
    has_same_letters?(candidate)
  end

  def has_same_letters?(candidate)
    candidate = candidate.downcase
    candidate.chars.uniq.all? do |char|
      candidate.count(char) == @converted_word.count(char)
    end
  end

  def not_same_size?(candidate)
    candidate.size != @target_size
  end

  def same_word?(candidate)
    candidate.downcase == @converted_word
  end
end
