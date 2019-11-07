module Gql
  # Information about a GraphQL [Input type](https://graphql.org/learn/schema/#input-types).
  class Input
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

    # @param name [String]
    # @param description [String]
    # @param fields [Array<Field>]
    # @return [void]
    def initialize(name: nil, description: nil, fields: [])
      self.name        = name
      self.description = description
      self.fields      = fields
    end
  end
end
