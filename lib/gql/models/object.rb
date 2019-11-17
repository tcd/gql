module Gql
  module Models
    # Information about a GraphQL [Object type](https://graphql.org/learn/schema/#object-types-and-fields).
    class Object
      include Gql::Comparison
      include Gql::Serialization

      # @return [String]
      attr_accessor :name
      # @return [String, nil]
      attr_accessor :description
      # @return [Array<Gql::Models::Field>]
      attr_accessor :fields
      # Interfaces implemented by the Object.
      # @return [Array<String>]
      attr_accessor :interfaces

      # @param name [String]
      # @param description [String]
      # @param fields [Array<Gql::Models::Field>]
      # @param interfaces [Array<String>]
      # @return [void]
      def initialize(name: nil, description: nil, fields: [], interfaces: [])
        self.name        = name
        self.description = description
        self.fields      = fields
        self.interfaces  = interfaces
      end

      # @return [Array<String>]
      def required_fields()
        return self.fields.select(&:required)
      end
    end
  end
end
