require 'minitest/autorun'
require_relative 'text_swap'

class TextTest < Minitest::Test
  def setup
    @file = File.open 'sample.txt', 'r'
    @text_object = Text.new(@file.read)
  end

  def test_swap_with_file
    previous_text = @text_object.instance_variable_get :@text
    current_text = @text_object.swap('i', 'e')
    refute_equal previous_text, current_text
  end

  def test_word_count
    actual = @text_object.word_count
    expected = 72
    assert_equal expected, actual
  end

  def teardown
    @file.close
  end
end
