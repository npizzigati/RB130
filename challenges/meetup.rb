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
  DAYS_IN_WEEK = 7

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(target_day_name, target_ordinal)
    first_candidate = calculate_candidate(target_day_name, :first)
    case target_ordinal
    when :first
      first_candidate
    when :second
      first_candidate + DAYS_IN_WEEK
    when :third
      first_candidate + DAYS_IN_WEEK * 2
    when :fourth
      first_candidate + DAYS_IN_WEEK * 3
    when :last
      calculate_last_candidate(target_day_name)
    when :teenth
      calculate_candidate(target_day_name, :teenth)
    end
  end

  def calculate_candidate(target_day_name, target_ordinal)
    first_search_day = case target_ordinal
                       when :first
                         1
                       when :teenth
                         13
                       end
    candidate_date = Date.new(@year, @month, first_search_day)

    loop do
      return candidate_date if matches?(candidate_date, target_day_name)
      candidate_date = candidate_date.next_day
    end
  end

  def calculate_last_candidate(target_day_name)
    last_day_of_month = calculate_last_day_of_month
    candidate_date = Date.new(@year, @month, last_day_of_month)

    loop do
      return candidate_date if matches?(candidate_date, target_day_name)
      candidate_date = candidate_date.prev_day
    end
  end

  def calculate_last_day_of_month
    candidate_date = Date.new(@year, @month, 28)
    loop do
      break if candidate_date.next_day.month != @month 
      candidate_date = candidate_date.next_day
    end
    candidate_date.day
  end

  def matches?(candidate_date, target_day_name)
    Date::DAYNAMES[candidate_date.wday].downcase == target_day_name.to_s
  end
end
