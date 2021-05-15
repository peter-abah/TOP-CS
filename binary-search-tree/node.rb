# frozen_string_literal: true

# A class implementing the node of a binary search tree
class Node
  attr_accessor :left, :right
  attr_reader :value
  
  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end