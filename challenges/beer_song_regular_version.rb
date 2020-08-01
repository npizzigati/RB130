# Beer Song
# Write a program that can generate the lyrics of the 99 Bottles
# of Beer song. See the test suite for the entire song.

REGULAR_VERSE = "%d bottles of beer on the wall, %d bottles of beer.\n" \
                "Take one down and pass it around, %d bottles of beer on the wall.\n"

VERSE_2 = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
                "Take one down and pass it around, 1 bottle of beer on the wall.\n"

VERSE_1 = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
                "Take it down and pass it around, no more bottles of beer on the wall.\n"

VERSE_0 = "No more bottles of beer on the wall, no more bottles of beer.\n" \
                "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

=begin

input: integer, or integer range (where inclusive bounds of range
are separated by a comma) (for BeerSong#verse)
output: string

requirements:
explicit:
- Output string will be verse n for input n, of verses n-m, inclusive, for input n, m.
- Verses 1 and 0 (actually last 2 verses) are different from verses 99 to 2
implicit:
- Return entire song if Beersong#lyrics is called

=end

# Questions: Wnat if number outside of range passed in? What if
# non-integer passed in?
# What if more than two arguments passed in?
# (I will assume no input validation)

# Approach:
# For single integer input: Insert input in REGULAR_VERSE, VERSE1 or VERSE2 string (depending on verse number entered) through
# placeholder expansion.
# For integer range: Call method to return verse for each verse
# number in range

class BeerSong
  def lyrics
    verses(99, 0)
  end

  def verses(start, stop)
    result = ''
    start.downto(stop) do |number|
      result << verse(number)
      result << "\n" unless number == stop
    end
    result
  end

  def verse(number)
    case number
    when 0
      VERSE_0
    when 1
      VERSE_1
    when 2
      VERSE_2
    when 3..99
      format(REGULAR_VERSE, number, number, number - 1)
    end
  end
end
