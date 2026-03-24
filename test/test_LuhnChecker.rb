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

  def test_validity_of_card_true_dirty_string
    assert LuhnCheckerLib.is_valid_bank_card_number?("620_00  0_000_000_000_005")
    assert LuhnCheckerLib.is_valid_bank_card_number?("2_20*0_000_(000_000_0d0   0_004")
    assert LuhnCheckerLib.is_valid_bank_card_number?("2_200_702_099_204_427")
    assert LuhnCheckerLib.is_valid_bank_card_number?("  2_20f0_701_809_218f_420   ")
    assert LuhnCheckerLib.is_valid_bank_card_number?("4_012_888_888_881    ")
    assert LuhnCheckerLib.is_valid_bank_card_number?("  378_282_246_310_005")
  end

  def test_validity_of_card_false_dirty_string
    refute LuhnCheckerLib.is_valid_bank_card_number?("   2_200_703f_101_!204_427")
    refute LuhnCheckerLib.is_valid_bank_card_number?("2_202_701_819_218_420")
    refute LuhnCheckerLib.is_valid_bank_card_number?("4_)012_   888_89Q7_881")
    refute LuhnCheckerLib.is_valid_bank_card_number?("3\d78_282_2  46_310_125   ")
    refute LuhnCheckerLib.is_valid_bank_card_number?("620 _000_012 _000_060_005 ")
    refute LuhnCheckerLib.is_valid_bank_card_number?("   2_20f0_000_01  0_010_000_004   ")
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

  def test_validity_imei_true
    assert LuhnCheckerLib.is_valid_IMEI?(86_004_108_979_539_0)
    assert LuhnCheckerLib.is_valid_IMEI?(8_600_410_897_953_82)
  end

  def test_validity_imei_false_incorrect_control_digit
    refute LuhnCheckerLib.is_valid_IMEI?(86_004_108_979_539_1)
    refute LuhnCheckerLib.is_valid_IMEI?(8_600_410_897_953_89)
  end

  def test_validity_imei_false_broken_imei
    refute LuhnCheckerLib.is_valid_IMEI?(86_504_109_979_439_0)
    refute LuhnCheckerLib.is_valid_IMEI?(8_601_510_897_853_82)
  end

  def test_validity_of_imei_true_dirty_string
    assert LuhnCheckerLib.is_valid_IMEI?("  86_004 %_108_ |979_5 IGIUD39_0")
    assert LuhnCheckerLib.is_valid_IMEI?(" 8_600__-) hj410_ 897_953_82   ")
  end

  def test_validity_of_imei_false_dirty_string
    refute LuhnCheckerLib.is_valid_IMEI?("  86_004_1.08_c979_5d39_1")
    refute LuhnCheckerLib.is_valid_IMEI?("8_600_d410_897_9d?53_89  ")
    refute LuhnCheckerLib.is_valid_IMEI?("86_5df04_1d09_9     79_439_0")
    refute LuhnCheckerLib.is_valid_IMEI?("  8_601_510|||_E897_853_82  ")
  end
end

class TestLuhnChecker_iccid < Minitest::Test
  def test_length_of_iccid_too_long
    refute LuhnCheckerLib.is_valid_ICCID?(89_701_000_000_000_000_164_545)
    refute LuhnCheckerLib.is_valid_ICCID?(8_970_112_233_445_566_771_732_633)
    refute LuhnCheckerLib.is_valid_ICCID?(8_970_100_000_000_000_001_493_736_734)
  end

  def test_length_of_iccid_too_short
    refute LuhnCheckerLib.is_valid_ICCID?(89_701_000)
    refute LuhnCheckerLib.is_valid_ICCID?(892_633)
    refute LuhnCheckerLib.is_valid_ICCID?(80)
    refute LuhnCheckerLib.is_valid_ICCID?(0)
  end

  def test_validity_iccid_true
    assert LuhnCheckerLib.is_valid_ICCID?(897_019_919_070_918_254)
    assert LuhnCheckerLib.is_valid_ICCID?(89_860_111_611_104_081_493)
    assert LuhnCheckerLib.is_valid_ICCID?(8_988_303_000_000_614_224)
  end

  def test_validity_iccid_false_incorrect_control_digit
    refute LuhnCheckerLib.is_valid_ICCID?(897_019_919_070_918_252)
    refute LuhnCheckerLib.is_valid_ICCID?(89_860_111_611_104_081_496)
    refute LuhnCheckerLib.is_valid_ICCID?(8_988_303_000_000_614_228)
  end

  def test_validity_iccid_false_broken_iccid
    refute LuhnCheckerLib.is_valid_ICCID?(897_019_918_070_928_254)
    refute LuhnCheckerLib.is_valid_ICCID?(89_861_111_621_104_071_493)
    refute LuhnCheckerLib.is_valid_ICCID?(8_978_303_001_000_614_224)
  end

  def test_validity_iccid_false_starts_not_with_89_
    refute LuhnCheckerLib.is_valid_ICCID?(617_019_919_070_918_250)
    refute LuhnCheckerLib.is_valid_ICCID?(39_860_111_611_104_081_496)
    refute LuhnCheckerLib.is_valid_ICCID?(8_588_313_000_010_614_227)
  end

  def test_validity_of_iccid_true_dirty_string
    assert LuhnCheckerLib.is_valid_ICCID?("897[_0E19 _9   19_07w0\\\_918_254")
    assert LuhnCheckerLib.is_valid_ICCID?("   89_860_111_61,1_fdad104_081_493")
    assert LuhnCheckerLib.is_valid_ICCID?("8_988_,30d  3_000_000_6,,,,\\\\d14_224   ")
  end

  def test_validity_of_iccid_false_dirty_string
    refute LuhnCheckerLib.is_valid_ICCID?("   897_019_y91 8_070_928_254   ")
    refute LuhnCheckerLib.is_valid_ICCID?("89_861_111    _62hj1_104\_071_493")
    refute LuhnCheckerLib.is_valid_ICCID?("8_978S_303_001_000_614_224")
    refute LuhnCheckerLib.is_valid_ICCID?("617_01.a_919_070_918_250     ")
    refute LuhnCheckerLib.is_valid_ICCID?("39_860_111_s6fg11_104_081_496")
    refute LuhnCheckerLib.is_valid_ICCID?("   8_588_313_000_01W0_614_227")
  end
end

# bundle exec ruby -Ilib:test test/test_LuhnChecker.rb
