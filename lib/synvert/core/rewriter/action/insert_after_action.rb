# frozen_string_literal: true

module Synvert::Core
  # InsertAfterAction to insert code next to the node.
  class Rewriter::InsertAfterAction < Rewriter::Action
    # Begin position to insert code.
    #
    # @return [Integer] begin position.
    def begin_pos
      @node.loc.expression.end_pos
    end

    # End position, always same to begin position.
    #
    # @return [Integer] end position.
    def end_pos
      begin_pos
    end

    private

    # Indent of the node.
    #
    # @param node [Parser::AST::Node]
    # @return [String] n times whitesphace
    def indent(node)
      ' ' * node.indent
    end
  end
end
