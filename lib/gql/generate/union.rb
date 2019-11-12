module Gql
  module Generate
    # @param union [Gql::Models::Union]
    # @return [String]
    def self.union(union)
      description = self.description(union.description)
      result = <<~END
        union #{union.name} = #{union.types.join(' | ')}
      END
      return description + result
    end
  end
end
