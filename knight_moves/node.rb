# frozen_string_literal: true

# A class to implement a node
class Node
  attr_reader :child_nodes
  attr_accessor :parent

  def initialize(parent = nil)
    @parent = parent
    @child_nodes = []
  end

  def add_child(node)
    return if child_nodes.contain?(node)

    node.parent = self
    @child_nodes.push(node)
  end
end
