# frozen_string_literal: true

def knight_moves(location, destination)
  return [location] if location == destination

  root = Node.new(location)
  node = find_destination(root)
end

def find_destination(node)
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