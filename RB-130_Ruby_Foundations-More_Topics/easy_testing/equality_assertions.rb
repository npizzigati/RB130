# Write a minitest assertion that will fail if value.downcase
# does not return 'xyz'.


require 'minitest/autorun'

class DowncaseTest < Minitest::Test
  def test_downcase
    value = 'XYX'
    assert_equal 'xyz', value.downcase
  end
end

