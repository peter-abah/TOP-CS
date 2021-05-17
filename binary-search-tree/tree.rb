# frozen_string_literal: true

require_relative 'node'

# A class implementing binary search trees data structure
class Tree
  def initialize(array)
    array = array.uniq.sort
    @root = build_tree(array, 0, array.length - 1)
  end

  def build_tree(array, start, end_index)
    return if start > end_index

    mid = (start + end_index) / 2

    root = Node.new(array[mid])
    root.left = build_tree(array, start, mid - 1)
    root.right = build_tree(array, mid + 1, end_index)

    root
  end

  def insert(node, root = @root)
    return if node == root

    if root < node
      root.right ? insert(node, root.right) : root.right = node
    else
      root.left ? insert(node, root.left) : root.left = node
    end
  end

  def delete(value, root = @root)
    return root if root.nil?

    if root.value > value
      root.left = delete(value, root.left)
    elsif root.value < value
      root.right = delete(value, root.right)
      
    elsif root.left.nil?
      root = root.right
    elsif root.right.nil?
      root = root.left

    else
      next_node = min_node(root.right)
      delete(next_node.value, root)
      root.value = next_node.value
    end
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def min_node(node)
    min = node
    min = min.left until min.left.nil?
    min
  end
end
