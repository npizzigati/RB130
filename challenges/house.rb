# Write a program that outputs the nursery rhyme "This is the
# House that Jack Built".

# The nursery rhyme reads as follows:

# This is the house that Jack built.

# This is the malt
# that lay in the house that Jack built.

# This is the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the rooster that crowed in the morn
# that woke the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the farmer sowing his corn
# that kept the rooster that crowed in the morn
# that woke the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the horse and the hound and the horn
# that belonged to the farmer sowing his corn
# that kept the rooster that crowed in the morn
# that woke the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.
# Please build your solution based on this partial program:

# Problem-solving notes:
# ----------------------
# Classes and methods:
# --------------------
# class House
# -----------
# #pieces() (supplied)
# Return an array of arrays<String, String>. Each inner array
# contains the first part of the first line of each verse (except
# the preceding "Tnis is" part, and the first part of the next line (the action))
# #recite()
# Return the song, with new lines between lines and spaces
# between verses.
# Approach:
# Assign a pieces variable to the return value of the
# pieces method.
# 1st verse: Pop off the final item of the pieces array and
# prepend "Tnis is " to it. Add two new lines.
# Second and subsequent verses: Pop final item from array and
# prepend "This is " to the first item of this subarray. Add new
# line. Prepend the second item of array to the original first
# item of previous popped item and add new line.

# For the first verse,
class House

  def initialize
    @things  = pieces.map { |piece| piece.first }
    @actions = pieces.map { |piece| piece.last }[0..-2]
  end

  def self.recite
    song = House.new
    song.assemble_verses
  end

  def assemble_verses
    verses = []
    first_verse = "This is #{pop_thing}.\n"
    verses << first_verse
    previous_verse = first_verse

    until @things.empty?
      new_verse = "This is #{pop_thing}\n"\
                  + previous_verse.sub('This is', pop_action)
      verses << new_verse
      previous_verse = new_verse
    end
    verses.join("\n")
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end

  def pop_thing
    @things.pop
  end

  def pop_action
    @actions.pop
  end
end
