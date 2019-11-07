module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Union]
    def self.parse_union(data)
      union = Union.new()
      union.name        = data[:name]
      union.description = data[:description]
      union.types       = data[:possibleTypes].map { |pt| pt[:name] }
      return union
    end
  end
end
