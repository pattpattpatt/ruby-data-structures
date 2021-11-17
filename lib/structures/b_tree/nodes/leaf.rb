# frozen_string_literal: true

require_relative './base'

module Structures
  module BTree
    module Nodes
      class Leaf < Base
        def insert(key, value)
          # Check if the key exists in the tree
          # Upsert if it does
          return data[key] = value if keys.include?(key)

          # If not, check if we need to do a split, return the result
          return split(key, value) if keys.size == page_size

          # Finally, insert the new key!

          # Gross, come back later
          keys << key
          keys.sort

          # Put that bad boy in the data set!
          # You did it, woo!
          data[key] = value
        end

        def split(key, value)
          # Allocate a new node
          new_node = NodeFactory.build_node(is_root: is_root, is_leaf: true, page_size)

          # Copy half the elements into the new node
          split_keys = keys[keys.size/2..keys.size]

          # Put the new element into the new node
          split_keys.each do |key|
            new_node.insert(key, data[key])
          end

          # Assign the new node to the parent of the current node
          new_node.set_parent(parent)
          parent.add_element(key, new_node)
        end
      end
    end
  end
end
