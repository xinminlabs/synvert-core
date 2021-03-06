# frozen_string_literal: true

module Synvert::Core
  # RemoveAction to delete code.
  class Rewriter::DeleteAction < Rewriter::Action
    def initialize(instance, *selectors)
      super(instance, nil)
      @selectors = selectors
    end

    # Begin position of code to replace.
    #
    # @return [Integer] begin position.
    def begin_pos
      @selectors.map { |selector| @node.child_node_range(selector).begin_pos }.min
    end

    # End position of code to replace.
    #
    # @return [Integer] end position.
    def end_pos
      @selectors.map { |selector| @node.child_node_range(selector).end_pos }.max
    end

    # The rewritten code, always empty string.
    def rewritten_code
      ''
    end
  end
end
