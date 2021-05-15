# frozen_string_literal: true

def factorial(number)
  return 1 if number < 1 # checks if n is less than 2 because of negative numbers

  number * factorial(number - 1)
end
