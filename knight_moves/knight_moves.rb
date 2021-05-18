# frozen_string_literal: true

require_relative 'node'

def knight_moves(location, destination)
  return [location] if location == destination

  root = Node.new(location)
  node = find_destination(root, destination)

  result = []
  until node.nil?
    result.push(node.value)
    node = node.parent
  end

  result.reverse
end

def find_destination(node, destination)
  queue = [node]
  is_done = false

  until is_done
    node = queue.shift
    if node.value == destination
      is_done = true
    else
      nodes = valid_moves(node.value).map { |pos| Node.new(pos, node) }
      queue.concat(nodes)
    end
  end

  node
end

def valid_moves((x, y))
  result = []

  [-1, -2, 1, 2].each do |n|
    if n.abs == 1
      result.push([x + n, y - 2])
      result.push([x + n, y + 2])
    else
      result.push([x + n, y - 1])
      result.push([x + n, y + 1])
    end
  end
  result.select { |pos| valid_move(pos) }
end

def valid_move((x, y))
  return false if x.negative? || x > 7 || y.negative? || y > 7

  true
end
