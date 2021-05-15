# frozen_string_literal: true

require_relative 'node'

# A class implementing Linked list data structure
class LinkedList
  attr_reader :head, :size, :tail

  def initialize(value = nil)
    @head = Node.new(value) unless value.nil?
    @tail = @head
    @size = @head.nil? ? 0 : 1
  end

  def append(value)
    node = Node.new(value)
    @head.nil? ? @head = node : @tail.next = node
    @tail = node
    @size += 1
    self
  end

  def prepend(value)
    node = Node.new(value, @head)
    @head = @head.nil? ? @tail = node : node

    @size += 1
    self
  end

  def at(index)
    return if index >= @size || index.negative?

    i = 0
    node = @head
    while i < index
      node = node.next
      i += 1
    end

    node
  end

  def pop
    return nil if @size.zero?

    if @size == 1
      result = @head
      @head = @tail = nil
    else
      node = @head
      node = node.next until node.next == @tail

      result = @tail
      @tail = node
      node.next = nil
    end
    result
  end

  def contains?(value)
    node = @head
    node = node.next until node.value == value || node.nil?
    node.nil? ? false : true
  end

  def find(value)
    node = @head
    i = 0
    until node.value == value || node.nil?
      node = node.next
      i += 1
    end

    node.nil? ? nil : i
  end

  def to_s
    result = []

    node = @head
    until node.nil?
      result.push("( #{node.value} )")
      node = node.next
    end

    result.push('nil')
    result.join(' -> ')
  end

  def insert_at(value, index)
    return if index >= @size || index.negative?

    return prepend(value) if index.zero?

    node = at(index - 1)

    node.next = Node.new(value, node.next)
    @size += 1
    self
  end

  def remove_at(index)
    return if index >= @size || index.negative?

    return pop if index.zero?

    prev = at(index - 1)
    node = prev.next

    result = node
    prev.next = node.next
    result
  end
end
