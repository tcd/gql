module Gql
  module Generate
    # @param union [Gql::Models::Union]
    # @return [String]
    def self.union(union)
      description = union.description ? %("""#{union.description}"""\n) : ""
      result = <<~END
        union #{union.name} = #{union.types.join(' | ')}
      END
      return description + result
    end
  end
end
