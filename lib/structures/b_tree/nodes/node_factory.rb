# frozen_string_literal: true

require_relative './internal'
require_relative './leaf'

module Structures
  module BTree
    module Nodes
      class NodeFactory
        ## Class Methods
        def self.build_node(parent, is_root: false, is_leaf: false, page_size:)
          tree_class = is_leaf ? BTree::Nodes::Leaf : BTree::Nodes::Internal
          tree_class.new(page_size, parent, is_root: is_root)
        end
      end
    end
  end
end
