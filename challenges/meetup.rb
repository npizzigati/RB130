# Meetup
# Typically meetups happen on the same day of the week.

# Examples are

# the first Monday
# the third Tuesday
# the Wednesteenth
# the last Thursday
# Note that "Monteenth", "Tuesteenth", etc are all made up
# words. There was a meetup whose members realised that there are
# exactly 7 days that end in '-teenth'. Therefore, one is
# guaranteed that each day of the week (Monday, Tuesday, ...)
# will have exactly one date that is named with '-teenth' in
# every month.

# Write code that calculates date of meetups.

# Problem breakdown
# -----------------
# Classes
# -------
# Meetup

# Methods
# -------
# Meetup#new(month, year)
#
# Meetup#day(Symbol weekday, Symbol ordinal)
# Returns a date object specifying day month and year of meetup
#
# Approach for #day: Iterate through days of month. Return date
# object when date meets both conditions
# Approach to determine whether date meets ordinal condition:
# Increment a counter each time the day of the week it hit;
# compare against hash ({1 => :first, 2 => second, etc...}) to
# determine when condition met. For ":teenth" ordinal condition,
# check whether day of month is between 13-19, inclusive. For
# "last" condition, day is that last of the weekday in question
# when loop terminates with no other day taking its place.

# Approach 2: create array of candidate dates by adding 7 to first
# candidate multiple times, up to month end. Determine month size
# according to hash table with months and sizes and Date#leap?

require 'date'

class Meetup

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(target_day_name, target_ordinal)
    candidates = calculate_candidates(target_day_name)
    case target_ordinal
    when :first
      candidates[0]
    when :second
      candidates[1]
    when :third
      candidates[2]
    when :fourth
      candidates[3]
    when :last
      candidates[-1]
    when :teenth
      candidates.select { |date| date.mday.between?(13, 19) }.first
    end
  end

  def calculate_candidates(target_day_name)
    first_day = Date.new(@year, @month, 1)
    last_day = Date.new(@year, @month, -1)
    first_day.upto(last_day).select do |date| 
      Date::DAYNAMES[date.wday] == target_day_name.to_s.capitalize
    end
  end
end
