# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/LuhnChecker"

class TestLuhnChecker < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LuhnChecker::VERSION
  end

  def test_length_of_bank_card_number_too_short
    refute LuhnCheckerLib.is_valid_bank_card_number?(45_003_452_123)
    refute LuhnCheckerLib.is_valid_bank_card_number?(18_262_879)
    refute LuhnCheckerLib.is_valid_bank_card_number?(2)
    refute LuhnCheckerLib.is_valid_bank_card_number?(0)
  end
end
