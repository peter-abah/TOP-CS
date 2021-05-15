# frozen_string_literal: true

# Finds out if the string is a palindrome by checking if
# the first and last characters are the same.
# Then recursively checks if the string excluding the 1st and last
# characters is a palindrome
# base case is if the string length is less than 2 which will always
# return true
def palindrome(string)
  return true if string.length < 2

  return false unless string[0] == string[-1]
  
  palindrome(string[1..-2])
end