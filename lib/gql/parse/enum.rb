module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Enum]
    def self.parse_enum(data)
      enum = Enum.new()
      enum.name        = data[:name]
      enum.description = data[:description]
      data[:enumValues].each do |v|
        enum.values.append({
          name:        v[:name],
          description: v[:description],
        })
      end
      return enum
    end
  end
end
