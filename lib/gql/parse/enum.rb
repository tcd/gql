module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Gql::Models::Enum]
    def self.enum(data)
      enum = Gql::Models::Enum.new()
      enum.name        = data[:name]
      enum.description = data[:description]
      data[:enumValues].each do |v|
        enum.values.append({
          name:        v[:name],
          description: v[:description],
          deprecation: v[:deprecationReason],
        })
      end
      return enum
    end
  end
end
