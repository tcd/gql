module Gql
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
    #   @return [Array<EnumValue>]
    attr_accessor :values

    # @param name [String]
    # @param description [String]
    # @param values [Array<EnumValue>]
    # @return [void]
    def initialize(name: nil, description: nil, values: [])
      self.name        = name
      self.description = description
      self.values      = values
    end
  end

  # Information about an individual value in a GraphQL [Enumeration type](https://graphql.org/learn/schema/#enumeration-types).
  class EnumValue
    include Gql::Comparison
    include Gql::Serialization

    # @!attribute [rw] name
    #   @return [String]
    attr_accessor :name

    # @!attribute [rw] description
    #   @return [String, nil]
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
