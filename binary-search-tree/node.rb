# frozen_string_literal: true

# A class implementing the node of a binary search tree
class Node
  include Comparable
  attr_accessor :left, :right, :value

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def <=>(other)
    value <=> other.value
  end
end
