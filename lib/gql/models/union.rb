module Gql
  module Models
    # Information about a GraphQL [Union type](https://graphql.org/learn/schema/#union-types).
    class Union
      include Gql::Comparison
      include Gql::Serialization

      # @return [String]
      attr_accessor :name

      # @return [String, nil]
      attr_accessor :description

      # @return [Array<String>]
      attr_accessor :types

      # @param name [String]
      # @param description [String]
      # @param types [Array<String>]
      # @return [void]
      def initialize(name: nil, description: nil, types: [])
        self.name        = name
        self.description = description
        self.types       = types
      end
    end
  end
end
