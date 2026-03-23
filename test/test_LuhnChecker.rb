# frozen_string_literal: true

require "test_helper"
require_relative '../LuhnChecker'

class TestLuhnChecker < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LuhnChecker::VERSION
  end

  def test_lengthOfBankCardNumber_tooShort
    refute IsValidBankCardNumber(45003452123)
    refute IsValidBankCardNumber(18262879)
    refute IsValidBankCardNumber(2)
    refute IsValidBankCardNumber(0)
    refute IsValidBankCardNumber
  end
end
