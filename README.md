# LuhnChecker

A library with methods for checking validity of IMEI, ICCID and bank card numbers.

## Installation

This gem wasn't published on RubyGems.

Local:
    Open <font color="orange"><ins>Gemfile</ins></font> in your project, add gem: <font color="orange"><ins>gem 'LuhnChecker', path: 'your_path_to_local_gem'</ins></font> and run <font color="orange">'<ins>bundle install</ins>'</font>. In your ruby scripts connect the library: <font color="orange"><ins>require LuhnChecker</ins></font>.


## Usage

After installing, connect the lib into your ruby scripts: <font color="orange"><ins>require LuhnChecker</ins></font>.

Methods:
    LuhnCheckerLib.is_valid_bank_card_number?(your_bank_card_number) - it returns true, if your_bank_card_number is valid; else false.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
