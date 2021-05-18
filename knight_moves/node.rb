# frozen_string_literal: true

# frozen_string_literal: true

# A class to implement a node
class Node
  attr_reader :value, :parent

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
  end
end
