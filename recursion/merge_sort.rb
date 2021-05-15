# frozen_string_literal: true

def merge_sort(array)
  return array if array.length < 2

  n = array.length / 2 - 1
  array0 = merge_sort(array[0..n])
  array1 = merge_sort(array[(n + 1)..-1])

  merge(array0, array1)
end

def merge(array0, array1)
  result = []
  i0 = 0
  i1 = 0

  while i0 < array0.length && i1 < array1.length
    if array0[i0] < array1[i1]
      result.push(array0[i0])
      i0 += 1
    else
      result.push(array1[i1])
      i1 += 1
    end
  end

  if i0 < array0.length
    result.concat(array0[i0..-1])
  else
    result.concat(array1[i1..-1])
  end
end

test = []
200.times { test.push(rand(200)) }

p merge_sort(test)