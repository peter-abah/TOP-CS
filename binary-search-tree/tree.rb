# frozen_string_literal: true

require_relative 'node'

# A class implementing binary search trees data structure
class Tree
  def initialize(array)
    array = array.uniq.sort
    @root = build_tree(array, 0, array.length)
  end

  def build_tree(array, start, end_index)
    return if start > end_index

    mid = (start + end_index) / 2

    root = Node.new(array[mid])
    root.left = build_tree(array, start, mid - 1)
    root.right = build_tree(array, mid + 1, end_index)

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
