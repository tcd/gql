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
    # The state of a class instance, used for comparison by {==}.
    def state
      return self.instance_variables.map { |variable| self.instance_variable_get variable }
    end
  end
end
