module Gql
  module Generate
    # @param data [Hash]
    # @return [String]
    def self.generate_enum(data)
      return <<~END
        """#{u_data[:description]}"""
        union #{u_data[:name]} = #{u_data[:types].join(' | ')}
      END
    end
  end
end
