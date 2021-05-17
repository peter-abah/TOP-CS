# frozen_string_literal: true

require_relative 'tree'

tree = Tree.new(Array.new(15) { rand(100) })

p tree.balanced?

p tree.in_order
p tree.pre_order
p tree.post_order
p tree.level_order

tree.insert(180)
tree.insert(599)
tree.insert(101)

p tree.balanced?

tree.rebalance

p tree.balanced?

p tree.in_order
p tree.pre_order
p tree.post_order
p tree.level_order
