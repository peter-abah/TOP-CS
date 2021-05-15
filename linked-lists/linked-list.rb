# frozen_string_literal: true

# A class implementing Linked list data structure
class LinkedList
  attr_reader :head

  def initialize(value = nil)
    @head = Node.new(value) unless value.nil?
    @tail = head
  end

  def append(value)
    node = Node.new(value)
    head.nil? ? @head = node : @head.next = node
    @tail = node
    self
  end
end

# A class to represent the node of a linked list
class Node
  attr_accessor :next

  def initialize(value)
    @value = value
    @next = nil
  end
end
