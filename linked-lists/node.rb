# frozen_string_literal: true

# A class to represent the node of a linked list
class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end
end
