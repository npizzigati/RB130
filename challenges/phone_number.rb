# Phone Number
# Write a program that cleans up user-entered phone numbers so
# that they can be sent as SMS messages.

# The rules are as follows:

# If the phone number is less than 10 digits assume that it is
# bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1,
# trim the 1 and use the last 10 digits
# If the phone number is 11 digits and the first number is not 1,
# then it is a bad number
# # If the phone number is more than 11 digits assume that it is
# # a bad number

# Classes
# Phone number
# Methods:

# new(String phone_number)
# Assign phone_number to instance variable

# number()
# Implicit rule: return string of ten zeros if number is invalid
# according to rules given in the instructions
# Otherwise process number according to the instructions

# area_code()
# Returns the 3 digit area code, witn no punctuation

# to_s()
# Returns number with punctuation

class PhoneNumber
  attr_reader :number

  TEN_ZEROS = '0' * 10

  def initialize(input)
    @number = extract_number(input)
  end

  def extract_number(input)
    format1 = /^(1?)(\d{10})$/
    format2 = /^(\(\d{3}\) \d{3}-\d{4})$/
    format3 = /^(\d{3}\.\d{3}\.\d{4}$)/
    format4 = /^(\d{3}\-\d{3}\-\d{4}$)/
    formats = [format1, format2, format3, format4]

    match_data = formats.map { |format| input.match(format) }
                        .find { |item| !item.nil? }

    result = if match_data
               retrieve_only_numbers(match_data)
             else
               TEN_ZEROS
             end
    result
  end

  def to_s
    "(#{area_code}) #{prefix}-#{line_number}"
  end

  def area_code
    number[0..2]
  end

  private

  def retrieve_only_numbers(match_data)
    match_data[-1].gsub(/\D/, '')
  end

  def prefix
    number[3..5]
  end

  def line_number
    number[6..9]
  end
end

