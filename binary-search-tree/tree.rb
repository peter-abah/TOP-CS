# frozen_string_literal: true

require_relative 'node'

# A class implementing binary search trees data structure
class Tree
  attr_reader :root

  def initialize(array)
    array = array.uniq.sort
    @root = build_tree(array, 0, array.length - 1)
  end

  def build_tree(array, start, end_index)
    return if start > end_index

    mid = (start + end_index) / 2

    root_node = Node.new(array[mid])
    root_node.left = build_tree(array, start, mid - 1)
    root_node.right = build_tree(array, mid + 1, end_index)

    root_node
  end

  def insert(node, root_node = @root)
    return if node == root_node

    if root_node < node
      root_node.right ? insert(node, root_node.right) : root_node.right = node
    else
      root_node.left ? insert(node, root_node.left) : root_node.left = node
    end
  end

  def delete(value, root_node = @root)
    return root_node if root_node.nil?

    if root_node.value > value
      root_node.left = delete(value, root_node.left)
    elsif root_node.value < value
      root_node.right = delete(value, root_node.right)

    elsif root_node.left.nil?
      root_node = root_node.right
    elsif root_node.right.nil?
      root_node = root_node.left

    else
      next_node = min_node(root_node.right)
      delete(next_node.value, root_node)
      root_node.value = next_node.value
    end
    root_node
  end

  def find(value, node = @root)
    return if node.nil?

    return find(value, node.right) if node.value < value

    return find(value, node.left) if node.value > value

    node
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

  def in_order(node = @root)
    result = []

    result.concat(in_order(node.left)) if node.left
    result.push(node.value)
    result.concat(in_order(node.right)) if node.right

    result
  end

  def pre_order(node = @root)
    result = []

    result.push(node.value)
    result.concat(pre_order(node.left)) if node.left
    result.concat(pre_order(node.right)) if node.right

    result
  end

  def post_order(node = @root)
    result = []

    result.concat(post_order(node.left)) if node.left
    result.concat(post_order(node.right)) if node.right
    result.push(node.value)

    result
  end

  def height(node = @root)
    return -1 if node.nil?

    h0 = height(node.left) + 1
    h1 = height(node.right) + 1

    [h0, h1].max
  end

  def depth(node, root_node = @root, d = 0)
    return if root_node.nil?

    return d if node == root_node

    depth(node, root_node.left, d + 1) || depth(node, root_node.right, d + 1)
  end

  def balanced?(node = @root)
    return true if node.nil?

    return false if (node.left.nil? ^ node.right.nil?) && height(node) > 1

    balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    array = in_order
    @root = build_tree(array, 0, array.length - 1)
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
