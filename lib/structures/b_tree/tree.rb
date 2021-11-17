# frozen_string_literal: true

require_relative './nodes/node_factory'

module Structures
  module BTree
    class Tree
      DEFAULT_PAGE_SIZE = 100

      # Has many BTreeNode

      ## Operations
      # insert | Inserts new key into the BTree, rebalancing if necessary
      # delete | Removes the key and associated value from the BTree, rebalancing if necessary
      # find   | Searches for the key in the BTree, returns the value if found, Null if not.
      #
      # Future:
      # fetch | Find or Insert if not found
      # bulk_insert | Take an array of objects and populate the tree

      attr_accessor :page_size, :root

      # @param elements | [Hash] | default: []
      #   This param should be used to initialize the structure
      #   Alternatively, you can initialize without elements and
      #   Call #insert on the BTree object iteratively
      # @param page_size | Int | default: DEFAULT_PAGE_SIZE
      def initialize(page_size = DEFAULT_PAGE_SIZE)
        @page_size = page_size
        @root = Nodes::NodeFactory.build_node(self, is_root: true, is_leaf: true, page_size: page_size)
      end

      # @param key | String | key value for the element
      # @param value | any | object to store
      def insert(key, value)
        root.insert(key, value)
      end

      # @param key | String | key to look up in tree
      def delete(key)
        
      end

      # @param key | String | key to look up in tree
      def find(key)
        
      end
    end
  end
end
