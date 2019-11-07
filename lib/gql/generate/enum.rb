module Gql
  module Generate
    # @param enum [Gql::Models::Enum]
    # @return [String]
    def self.enum(enum)
      return <<~END
        """#{enum.description}"""
        union #{enum.name} = #{enum.types.join(' | ')}
      END
    end
  end
end
