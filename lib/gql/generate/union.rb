module Gql
  module Generate
    # @param union [Gql::Models::Union]
    # @return [String]
    def self.union(union)
      return <<~END
        """#{union.description}"""
        union #{union.name} = #{union.types.join(' | ')}
      END
    end
  end
end
