# frozen_string_literal: true

module Structures
  module BTree
    module Nodes
      class Base
        ## Errors
        class NoImplementation < StandardError; end

        attr_accessor :is_root, :page_size, :keys, :data

        # @param is_root | Boolean | Says whether or not this node should be the root of the tree
        # @param page_size | Int | Determines size of page
        def initialize(page_size, **kwargs)
          @is_root = kwargs[:is_root]
          @page_size = page_size
          set_parent(kwargs[:parent]) unless kwargs[:parent].nil?
          @keys = []
          @data = {}
        end

        def insert(key, value)
          raise NoImplementation, "Subclass must implement"
        end

        def set_parent(parent)
          @parent = parent
        end

        def add_element(key, node)
          keys << key
          keys.sort
        end
      end
    end
  end
end
