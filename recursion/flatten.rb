# frozen_string_literal: true

def flatten(array)
  return array unless array.instance_of? Array

  result = []
  array.each { |elem| result.push(*flatten(elem)) }
  result
end
