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

# Approach 2: create array of candidates by adding 7 to first
# candidate multiple times

class Meetup
  ORDINAL_TABLE = { 1 => :first,
                    2 => :second,
                    3 => :third,
                    4 => :fourth }
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, ordinal)
    day = 1
    ordinal_count = 0
    previous_temp = nil
    loop do
      begin 
        temp = Date.new(@year, @month, day)
      rescue ArgumentError
        break
      end
      if temp.send(weekday.to_s + '?')
        ordinal_count += 1 
        return temp if ordinal == :teenth && day.between?(13, 19) 
        return temp if ORDINAL_TABLE[ordinal_count] == ordinal
        previous_temp = temp
      end
      day += 1
    end
    return previous_temp if ordinal == :last
  end
end
