module Gql
  module Models
    # Information about a GraphQL [Enumeration type](https://graphql.org/learn/schema/#enumeration-types).
    class Enum
      include Gql::Comparison
      include Gql::Serialization

      # @return [String]
      attr_accessor :name
      # @return [String, nil]
      attr_accessor :description
      # @return [Array<Hash>]
      attr_accessor :values

      # @param name [String]
      # @param description [String]
      # @param values [Array<Hash>]
      # @return [void]
      def initialize(name: nil, description: nil, values: [])
        self.name        = name
        self.description = description
        self.values      = values
      end
    end
  end
end
