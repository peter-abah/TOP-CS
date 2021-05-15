# frozen_string_literal: true

require_relative 'roman_to_number'

HASH2 = {
  1000 => 'm',
  900 => 'cm',
  500 => 'd',
  400 => 'cd',
  100 => 'c',
  90 => 'xc',
  50 => 'l',
  40 => 'xl',
  10 => 'x',
  9 => 'ix',
  5 => 'v',
  4 => 'iv',
  1 => 'i'
}.freeze

def number_to_roman(number)
  result = ''
  HASH2.each do |key, value|
    n = number / key
    next if n.zero?

    result += value * n
    number %= key
  end
  result
end

p roman_to_number(number_to_roman(3949))
