# frozen_string_literal: true

module Synvert::Core
  # AddAction to add code to the node.
  class Rewriter::InsertAction < Rewriter::Action
    def initialize(instance, code, at:)
      @instance = instance
      @code = code
      @at = at
      @node = @instance.current_node
    end

    # Begin position to insert code.
    #
    # @return [Integer] begin position.
    def begin_pos
      if @at == 'end'
        @node.loc.expression.end_pos
      else
        @node.loc.expression.begin_pos
      end
    end

    # End position, always same to begin position.
    #
    # @return [Integer] end position.
    def end_pos
      begin_pos
    end

    # The rewritten source code.
    #
    # @return [String] rewritten code.
    def rewritten_code
      rewritten_source
    end
  end
end
