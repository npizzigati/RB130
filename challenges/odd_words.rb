# Odd words

# Input: String
# Ouput: String

# Odd words copied in reverse order. Even words just copied
# Spaces normalized to one between words and none between final
# word and period.

# Example input and output all lowercase. can we assume all input
# will be lowercase?

# Approach: Loop through input string. Start counter at zero and
# at each space add one -- this is the word number. If word
# number is even, print out characters as they are read in
# (output only one space between words -- how to handle last
# space between last word and period?).

# For odd words, read characters into a temporary array and the
# output them backwards. Or read them from back to front and
# output as you go along.

# Approach 2: find indexes of word boundaries. At each even word
# boundary pair, print from front to back. At each odd word
# boundary pair, print from back to front.

# Simple approach: Split strings (on whitespace or periods) into array. Print
# out array words one by one, with the odd ones reversed, with a
# space in between. Add a period at the end.

class OddWords
  def initialize(string)
    @string = string
  end

  def build_output
    result = ''
    words = @string.gsub(/[\s.]+/, ' ').split
    words_size = words.size
    words.each_with_index do |word, index|
      if index.even?
        result << word
      else
        result << word.reverse
      end
      result << ' ' unless index == words_size - 1
    end
    result << '.'
    result
  end
end

class OddWords2
  def initialize(string)
    @string = string[0..-2].strip
    @word_count = 0
    @char_count = 0
  end

  def output
    size = @string.size
    while @char_count < size - 1
      skip_spaces
      if @word_count.even?
        read_and_output_word_forwards
      else
        read_and_output_word_backwards
      end
      @char_count += 1
      @word_count += 1
      print ' ' if @char_count < size - 1
    end
    print '.'
  end

  def skip_spaces
    return if @string[@char_count] != ' '
    while @string[@char_count] == ' '
      @char_count += 1
    end
  end

  def read_and_output_word_forwards
    while /[\s.]/ !~ @string[@char_count] do
      print @string[@char_count]
      sleep 0.1
      @char_count += 1
    end
  end

  def read_and_output_word_backwards
    start_pos = @char_count
    end_pos = find_word_end_pos
    end_pos.downto(start_pos) do |index|
      print @string[index]
      sleep 0.1
    end
    @char_count += (end_pos - start_pos)
  end

  def find_word_end_pos
    end_pos = @char_count
    end_pos += 1 while /\w/ =~ @string[end_pos + 1]
    end_pos
  end

end
