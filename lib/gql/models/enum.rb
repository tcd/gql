module Gql
  module Models
    # Information about a GraphQL [Enumeration type](https://graphql.org/learn/schema/#enumeration-types).
    class Enum
      include Gql::Comparison
      include Gql::Serialization

      # @!attribute [rw] name
      #   @return [String]
      attr_accessor :name

      # @!attribute [rw] description
      #   @return [String, nil]
      attr_accessor :description

      # @!attribute [rw] values
      #   @return [Array<Hash<:name, :description>>]
      attr_accessor :values

      # @!attribute [rw] deprecation
      #   `nil` unless the Enum is deprecated.
      #   See the [Non-Null modifier](https://graphql.org/learn/schema/#lists-and-non-null) in the GraphQL Spec.
      #   @return [String,nil]
      attr_accessor :deprecation

      # @param name [String]
      # @param description [String]
      # @param values [Array<Hash>]
      # @param deprecation [String]
      # @return [void]
      def initialize(name: nil, description: nil, values: [], deprecation: nil)
        self.name        = name
        self.description = description
        self.values      = values
        self.deprecation = deprecation
      end
    end
  end
end
