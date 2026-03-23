# frozen_string_literal: true

require_relative "LuhnChecker/version"

module LuhnCheckerLib

  #Checks validity of bank card number
  def IsValidBankCardNumber?(bankcardnumber)
    digits = bankcardnumber.to_s.gsub(/\D/, '').chars.map(&:to_i)
    return false if digits.empty?
  
    check_sum = digits.pop
    sum = digits.reverse.each_with_index do |digit, index|
      if index.even?
        digit *= 2
        digit -= 9 if digit > 9
      else
        digit
      end
    end
  
    calculated_checksum = (10 - (sum % 10)) % 10
    check_sum == calculated_checksum
  end
  
  #Checks validity of IMEI
  def IsValidIMEI?(imei)
    nil
  end

  #Checks validity of ICCID
  def IsValidICCID?(iccID)
    nil
  end

end