# Pig Latin
# Pig Latin is a made-up children's language that's intended to
# be confusing. It obeys a few simple rules (below), but when
# it's spoken quickly it's really difficult for non-children (and
# non-native speakers) to understand.

# Rule 1: If a word begins with a vowel sound, add an "ay" sound
# to the end of the word.
# Rule 2: If a word begins with a consonant sound, move it to the
# end of the word, and then add an "ay" sound to the end of the
# word.
# There are a few more rules for edge cases, and there are
# regional variants too.

# Input: string
# Output: string

# Rules:
# Explicit:
# Output string is the Pig Latin translation of the input string 
# (See above description)
# Implicit:
# Vowel sounds include y and x when followed by consonants);
# Consonant sounds include multiletter sounds qu (with or without
# a preceding s), th, thr, ch, sch
# Approach:
# Identity vowel sounds and consonant sounds (i.e. the
# letters involved); create two regex and put the appropriate
# letters in each regex.
# 
# First test word against vowel sounds; if positive match, add
# 'ay' to end of word and return
#
# Next test word against consonant sounds to get matching
# group. Move matching group to end of word and add 'ay'

class PigLatin
  VOWEL_STARTS = /^[aeiou]|[xy][^aeiou]/
  CONSONANT_STARTS = /^[^aeiou]*qu|^[^aeiou]{1,3}/

  def self.translate(phrase)
    phrase.split(' ').map do |word| 
      return word + 'ay' if VOWEL_STARTS =~ word
      leader = (CONSONANT_STARTS.match(word))[0]
      word.gsub(CONSONANT_STARTS, '') + leader + 'ay'
    end.join(' ')
  end
end
