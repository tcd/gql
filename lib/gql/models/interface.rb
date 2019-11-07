module Gql
  module Models
    # Information about a GraphQL [Interface](https://graphql.org/learn/schema/#interfaces).
    class Interface
      include Gql::Comparison
      include Gql::Serialization

      # @!attribute [rw] name
      #   @return [String]
      attr_accessor :name

      # @!attribute [rw] description
      #   @return [String, nil]
      attr_accessor :description

      # @!attribute [rw] fields
      #   @return [Array<Gql::Models::Field>]
      attr_accessor :fields

      # @param name [String]
      # @param description [String]
      # @param fields [Array<Gql::Models::Field>]
      # @return [void]
      def initialize(name: nil, description: nil, fields: [])
        self.name        = name
        self.description = description
        self.fields      = fields
      end
    end
  end
end
