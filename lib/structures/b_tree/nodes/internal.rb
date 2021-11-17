# frozen_string_literal: true

require_relative './base'

module Structures
  module BTree
    module Nodes
      class Internal < Base
        ## Errors
        class InvalidNodeType < StandardError; end

        attr_accessor :is_root, :page_size, :keys, :sub_trees

        def insert(key, value)
          # Lets just start with a naive keys array search
          # We can assume keys is sorted here
          keys.each do |search_index|
            if key < search_index
              return data[search_index].insert(key, value)
            end
          end

          # Make a new sub tree!
          new_node = BTreeNode::NodeFactory.build_node(self, is_root: false, is_leaf: true, page_size: page_size)
          new_node.insert(key, value)
          data[key] = new_node

          # Add the key!
          keys << key
          keys.sort
        end

        def split()
          # Allocate a new node
          new_node = NodeFactory.build_node(self, is_root: is_root, is_leaf: true, page_size)
          super(key, value)
          raise StandardError.new("Splitting is gross")
        end
      end
    end
  end
end
