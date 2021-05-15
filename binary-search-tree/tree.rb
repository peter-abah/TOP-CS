# frozen_string_literal: true

require_relative 'node'

# A class implementing binary search trees data structure
class Tree
  def initialize(array)
    @root = build_tree(array)
  end
end
