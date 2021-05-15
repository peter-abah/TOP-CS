# frozen_string_literal' true

HASH = {
  'i' => 1,
  'v' => 5,
  'x' => 10,
  'l' => 50,
  'c' => 100,
  'd' => 500,
  'm' => 1000
}.freeze

def roman_to_number(string)
  string = string.downcase
  return HASH[string] if string.length == 1

  n0 = HASH[string[0]]
  n1 = roman_to_number(string[1..-1])
  n0 >= n1 ? n1 + n0 : n1 - n0
end

p roman_to_number('mmmcmxlix')