# frozen_string_literal: true

require_relative "LuhnChecker/version"

# module for checking IMEIs, Bank Card numbers and ICCIDs
module LuhnCheckerLib
  module_function

  # Checks validity of bank card number
  def is_valid_bank_card_number?(bankcardnumber)
    digits = bankcardnumber.to_s.gsub(/\D/, "").chars.map(&:to_i)

    return false unless digits.length.between?(13, 19)

    check_sum = digits.pop
    sum = digits.reverse.each_with_index.map do |digit, index|
      if index.even?
        doubled = digit * 2
        doubled > 9 ? doubled - 9 : doubled
      else
        digit
      end
    end.sum

    check_sum == (10 - (sum % 10)) % 10
  end

  # Checks validity of IMEI
  def is_valid_IMEI?(imei)
    digits = imei.to_s.gsub(/\D/, "").chars.map(&:to_i)

    return false unless digits.length == 15

    provided_checksum = digits.pop

    sum = digits.reverse.each_with_index.map do |digit, index|
      if index.even?
        doubled = digit * 2
        doubled > 9 ? doubled - 9 : doubled
      else
        digit
      end
    end.sum

    provided_checksum == (10 - (sum % 10)) % 10
  end

  # Checks validity of ICCID
  def is_valid_ICCID?(iccid)
    iccid_str = iccid.to_s.gsub(/\D/, "")
    return false unless iccid_str.start_with?("89")

    digits = iccid_str.chars.map(&:to_i)
    return false unless digits.length.between?(18, 20)

    provided_checksum = digits.pop

    sum = digits.reverse.each_with_index.map do |digit, index|
      if index.even?
        doubled = digit * 2
        doubled > 9 ? doubled - 9 : doubled
      else
        digit
      end
    end.sum

    provided_checksum == (10 - (sum % 10)) % 10
  end
end
