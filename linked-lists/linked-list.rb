# frozen_string_literal: true

# A class implementing Linked list data structure
class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end
end

# A class to represent the node of a linked list
class Node

  def initialize(value)
    @value = value
    @next = nil
  end
end