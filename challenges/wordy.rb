# Wordy
# Write a program that takes a word problem and returns the
# answer as an integer.

# E.g.

# What is 5 plus 13?

# The program should return 18.

# What is 7 minus 5 minus 1?

# The program should return 1.

# Remember, that these are verbal word problems, not treated as
# you normally would treat a written problem. This means that you
# calculate as you move forward each step. This means 3 + 2 * 3 =
# 15, not 9.

# Hint: to solve this problem elegantly, you need to know how the
# send method works in Ruby. If you haven't seen it before, check
# it out here.

# classes:

# WordProblem

# methods:

# initialize(String word_problem):
# Save word_problem (or components of problem) as instance variable
# Components of problem:
# - Question words: "What is"
# - First integer
# - Operation (spelled out): plus, minus, multiplied by, divided by
# - Second integer
# - Question mark
# If problem doesn't break down into above components, raise
# ArgumentError

# answer()
# return integer answer to word problem
# Approach:
#

class WordProblem
  OPERATIONS = { 'plus' => :+,
                 'minus' => :-,
                 'divided by' => :/,
                 'multiplied by' => :* }

  def initialize(problem)
    @problem = problem
    parse
  end

  def parse
    regex1 = /^What is (?<int1>\-?\d+) (?<op1>(#{list_operations})) (?<int2>\-?\d+)/
    regex2 = /^(\?| (?<op2>(#{list_operations})) (?<int3>\-?\d+)\?)/

    match_part1 = @problem.match(regex1)
    if match_part1
      remaining_part = @problem.sub(match_part1[0], '')
      match_part2 = remaining_part.match(regex2)
    end

    raise ArgumentError, 'Invalid problem' unless match_part1 && match_part2

    @int1 = match_part1[:int1].to_i
    @int2 = match_part1[:int2].to_i
    @int3 = match_part2[:int3].to_i
    @operation1 = match_part1[:op1]
    @operation2 = match_part2[:op2]
  end

  def answer
    result1 = @int1.send(OPERATIONS[@operation1], @int2)
    if @operation2
      final_result = result1.send(OPERATIONS[@operation2], @int3)
    else
      final_result = result1
    end

    final_result
  end

  private

  def list_operations
    OPERATIONS.keys.join('|')
  end
end
