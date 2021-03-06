module Gql
  module Models
    # Information about a GraphQL [Scalar type](https://graphql.org/learn/schema/#scalar-types).
    class Scalar
      include Gql::Comparison
      include Gql::Serialization

      # @return [String]
      attr_accessor :name
      # @return [String, nil]
      attr_accessor :description

      # @param name [String]
      # @param description [String]
      # @return [void]
      def initialize(name: nil, description: nil)
        self.name        = name
        self.description = description
      end
    end
  end
end
