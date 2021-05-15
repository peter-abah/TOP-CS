# frozen_string_literal: true

# A class to represent the node of a linked list
class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value)
    @value = value
    @next = nil
  end
end
