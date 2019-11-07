module Gql
  module Generate
    # @param union_data [Hash]
    # @return [String]
    def self.generate_union(u_data)
      return <<~END
        """#{u_data[:description]}"""
        union #{u_data[:name]} = #{u_data[:types].join(' | ')}
      END
    end
  end
end
