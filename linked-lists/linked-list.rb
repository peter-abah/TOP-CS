# frozen_string_literal: true

# A class implementing Linked list data structure
class LinkedList
  attr_reader :head, :size, :tail

  def initialize(value = nil)
    @head = Node.new(value) unless value.nil?
    @tail = head
    @size = @head.nil? ? 0 : 1
  end

  def append(value)
    node = Node.new(value)
    @head.nil? ? @head = node : @head.next = node
    @tail = node
    @size += 1
    self
  end

  def prepend(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end

    @size += 1
    self
  end

  def at(index)
    return nil if index >= @size || index.negative?

    i = 0
    node = @head
    while i < index
      node = node.next
      i += 1
    end

    node
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
