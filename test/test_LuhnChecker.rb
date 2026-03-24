# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/LuhnChecker"

class TestLuhnChecker_bankCard_number < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LuhnChecker::VERSION
  end

  def test_length_of_bank_card_number_too_short
    refute LuhnCheckerLib.is_valid_bank_card_number?(452_003_452_123)
    refute LuhnCheckerLib.is_valid_bank_card_number?(18_262_879)
    refute LuhnCheckerLib.is_valid_bank_card_number?(2)
    refute LuhnCheckerLib.is_valid_bank_card_number?(0)
  end

  def test_length_of_bank_card_number_too_long
    refute LuhnCheckerLib.is_valid_bank_card_number?(452_003_452_123_837_837_123)
    refute LuhnCheckerLib.is_valid_bank_card_number?(18_262_879_854_393_777_666_555)
    refute LuhnCheckerLib.is_valid_bank_card_number?(562_736_928_510_327_379_982_837)
  end

  def test_validity_of_card_true_16_digits
    assert LuhnCheckerLib.is_valid_bank_card_number?(2_200_702_099_204_427)
    assert LuhnCheckerLib.is_valid_bank_card_number?(2_200_701_809_218_420)
  end

  def test_validity_of_card_true_less_than_16_digits
    assert LuhnCheckerLib.is_valid_bank_card_number?(4_012_888_888_881)
    assert LuhnCheckerLib.is_valid_bank_card_number?(378_282_246_310_005)
  end

  def test_validity_of_card_true_bigger_than_16_digits
    assert LuhnCheckerLib.is_valid_bank_card_number?(620_000_000_000_000_005)
    assert LuhnCheckerLib.is_valid_bank_card_number?(2_200_000_000_000_000_004)
  end

  def test_validity_of_card_false_incorrect_control_digit_16_digits
    refute LuhnCheckerLib.is_valid_bank_card_number?(2_200_702_099_204_428)
    refute LuhnCheckerLib.is_valid_bank_card_number?(2_200_701_809_218_422)
  end

  def test_validity_of_card_false_incorrect_control_digit_less_bigger_16_digits
    refute LuhnCheckerLib.is_valid_bank_card_number?(4_012_888_888_882)
    refute LuhnCheckerLib.is_valid_bank_card_number?(378_282_246_310_008)
    refute LuhnCheckerLib.is_valid_bank_card_number?(620_000_000_000_000_003)
    refute LuhnCheckerLib.is_valid_bank_card_number?(2_200_000_000_000_000_009)
  end

  def test_validity_of_card_false_incorrect_broken_card_number
    refute LuhnCheckerLib.is_valid_bank_card_number?(2_200_703_101_204_427)
    refute LuhnCheckerLib.is_valid_bank_card_number?(2_202_701_819_218_420)
    refute LuhnCheckerLib.is_valid_bank_card_number?(4_012_888_897_881)
    refute LuhnCheckerLib.is_valid_bank_card_number?(378_282_246_310_125)
    refute LuhnCheckerLib.is_valid_bank_card_number?(620_000_012_000_060_005)
    refute LuhnCheckerLib.is_valid_bank_card_number?(2_200_000_010_010_000_004)
  end
end

class TestLuhnChecker_imei < Minitest::Test
  def test_length_of_imei_too_long
    refute LuhnCheckerLib.is_valid_IMEI?(86_004_108_979_539_012)
    refute LuhnCheckerLib.is_valid_IMEI?(8_600_410_897_953_828_376)
  end

  def test_length_of_imei_too_short
    refute LuhnCheckerLib.is_valid_IMEI?(86_004_108_979)
    refute LuhnCheckerLib.is_valid_IMEI?(8606)
    refute LuhnCheckerLib.is_valid_IMEI?(0)
  end
end

# bundle exec ruby -Ilib:test test/test_LuhnChecker.rb
