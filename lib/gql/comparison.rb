module Gql
  # Basic implementation of `#==` and `#eql?` for comparing two class instances.
  module Comparison

    # Compare two class instances.
    # @param other [Object]
    # @return [Boolean]
    def ==(other)
      return other.class == self.class && other.state == self.state
    end

    alias eql? ==

    # An array with all of an instance variable's values; used for comparison by {==}.
    # @return [Array]
    def state
      return self.instance_variables.map { |variable| self.instance_variable_get(variable) }
    end

  end
end
