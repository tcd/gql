module Gql
  module Models
    # Information about a GraphQL [Object type](https://graphql.org/learn/schema/#object-types-and-fields).
    class Object
      include Gql::Comparison
      include Gql::Serialization

      # @!attribute [rw] name
      #   @return [String]
      attr_accessor :name

      # @!attribute [rw] description
      #   @return [String, nil]
      attr_accessor :description

      # @!attribute [rw] fields
      #   @return [Array<Field>]
      attr_accessor :fields

      # @!attribute [rw] interfaces
      #   Interfaces implemented by the Object.
      #   @return [Array<String>]
      attr_accessor :interfaces

      # @return [void]
      def initialize(name: nil, description: nil, fields: [], interfaces: [])
        self.name        = name
        self.description = description
        self.fields      = fields
        self.interfaces  = interfaces
      end
    end
  end
end
