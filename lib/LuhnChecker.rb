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
    sum = digits.reverse.each_with_index do |digit, index|
      if index.even?
        digit *= 2
        digit - 9 if digit > 9
      else
        digit
      end
    end

    calculated_checksum = (10 - (sum % 10)) % 10
    check_sum == calculated_checksum
  end

  # Checks validity of IMEI
  def is_valid_IMEI?(imei)
    nil
  end

  # Checks validity of ICCID
  def is_valid_ICCID?(iccID)
    nil
  end
end
