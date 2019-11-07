module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Union]
    def self.union(data)
      union = Gql::Models::Union.new()
      union.name        = data[:name]
      union.description = data[:description]
      union.types       = data[:possibleTypes].map { |pt| pt[:name] }
      return union
    end
  end
end
