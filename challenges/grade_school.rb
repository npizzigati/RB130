# Grade School
# Write a small archiving program that stores students' names
# along with the grade that they are in.

# In the end, you should be able to:

# Add a student's name to the roster for a grade
# "Add Jim to grade 2."
# "OK."
# Get a list of all students enrolled in a grade
# "Which students are in grade 2?"
# "We've only got Jim just now."
# Get a sorted list of all students in all grades. Grades should
# sort as 1, 2, 3, etc., and students within a grade should be
# sorted alphabetically by name.

# {1=>["Anna", "Barb", "Charlie"], 2=>["Alex", "Peter"], ...}
# The exact output format doesn't matter: what's important is
# that it shows all of the students and grades in the proper
# order.

# Note that all our students only have one name. (It's a small
# town, what do you want?)

# Problem breakdown
# Classes: School; maybe also Student

# Methods:

# School#new()
# initialize @grades instance variable as hash with default
# being an empty array

# School#add(String name, Integer grade)
# Return value: none specified
# APPROACH:

# School#grade(Integer grade)
# Return a sorted array of the students in a grade

# School#to_h()
# Returns hash of sorted grades and students:
# e.g., { 2 => %w(Blair James Paul) }


class School
  def initialize
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(name, grade_number)
    grades[grade_number] << name
  end

  def grade(grade_number)
    grades[grade_number]
  end

  def to_h
    grades.each { |_, names| names.sort! }
    grades.sort.to_h
  end

  private

  attr_accessor :grades
end
