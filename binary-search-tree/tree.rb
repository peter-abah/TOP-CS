# frozen_string_literal: true

require_relative 'node'

# A class implementing binary search trees data structure
class Tree
  def initialize(array)
    array = array.uniq.sort
    @root = build_tree(array)
  end

  def build_tree(array)
    return if array.empty?

    start = 0
    end_index = array.length - 1
    mid = (start + end_index) / 2

    root = Node.new(array[mid])
    root.left = build_tree(array[0..(mid - 1)])
    root.right = build_tree(array[(mid + 1)..-1])

    root
  end
end
