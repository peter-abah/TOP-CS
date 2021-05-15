# frozen_string_literal: true

# returns the nth number of the fibonnaci sequence
def fibbonaci(n)
  return 0 if n == 1
  return 1 if n == 2 

  fibbonaci(n - 1) + fibbonaci(n - 2)
end

# returns the first n numbers of the fibbonaci sequence
# using iteration
def fibs(n)
  result = []

  0.upto(n - 1) do |i|
    if [0, 1].include?(i)
      result.push(i)
    else
      num = result[i - 1] + result[i - 2]
      result.push(num)
    end
  end

  result
end

# returns the first n numbers of the fibbonaci sequence
# using recursion
def fibs_rec(n)
  return [0] if n == 1

  return [0, 1] if n == 2

  result = fibs_rec(n - 1)
  num = result[n - 2] + result[n - 3]
  result.push(num)
end

p fibs_rec(10)
p fibs(10)
p fibbonaci(10)
