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

  def find(value, root = @root)
    return if root.nil?

    return find(value, root.right) if root.value < value

    return find(value, root.left) if root.value > value

    root
  end

  def level_order
    result = []
    queue = [@root]

    until queue.empty?
      node = queue.shift
      result.push(node.value)
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end

    result
  end

  def in_order(root = @root)
    result = []

    result.concat(in_order(root.left)) if root.left
    result.push(root.value)
    result.concat(in_order(root.right)) if root.right

    result
  end

  def pre_order(root = @root)
    result = []

    result.push(root.value)
    result.concat(pre_order(root.left)) if root.left
    result.concat(pre_order(root.right)) if root.right

    result
  end

  def post_order(root = @root)
    result = []

    result.concat(post_order(root.left)) if root.left
    result.concat(post_order(root.right)) if root.right
    result.push(root.value)

    result
  end

  def height(root = @root)
    return -1 if root.nil?

    h0 = height(root.left) + 1
    h1 = height(root.right) + 1

    [h0, h1].max
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
