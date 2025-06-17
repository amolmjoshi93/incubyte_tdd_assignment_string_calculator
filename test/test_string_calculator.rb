# frozen_string_literal: true

require "test_helper"

class TestStringCalculator < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::StringCalculator::VERSION
  end

  def test_add_with_empty_string
    assert_equal 0, StringCalculator::Addition.perform("")
  end

  def test_add_with_nil
    assert_equal 0, StringCalculator::Addition.perform(nil)
  end

  def test_add_with_one_number
    assert_equal 1, StringCalculator::Addition.perform("1")
  end

  def test_add_with_multiple_numbers
    assert_equal 22, StringCalculator::Addition.perform("1,5,7,9")
  end

  def test_add_with_multiple_negative_numbers_and_spaces
    assert_equal 11, StringCalculator::Addition.perform(" 1 , -3 , 5, 8 ")
  end

  def test_add_with_new_line_char
    assert_equal 10, StringCalculator::Addition.perform("1\n2,3\n4")
  end
end
