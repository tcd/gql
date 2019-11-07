module Gql
  # Information about a GraphQL [Argument](https://graphql.org/learn/schema/#arguments).
  class Argument
    include Gql::Comparison
    include Gql::Serialization

    # @!attribute [rw] name
    #   @return [String]
    attr_accessor :name

    # @!attribute [rw] description
    #   @return [String, nil]
    attr_accessor :description

    # @!attribute [rw] type
    #   @return [String]
    attr_accessor :type

    # @!attribute [rw] required
    #   [See the GraphQL Spec](https://graphql.org/learn/schema/#lists-and-non-null).
    #   @return [Boolean]
    attr_accessor :required

    # @!attribute [rw] default
    #   @return [String, nil]
    attr_accessor :default

    # @param name [String]
    # @param description [String]
    # @param type [String]
    # @param required [Boolean]
    # @param default [String, nil]
    # @return [void]
    def initialize(
      name: nil,
      description: nil,
      type: nil,
      required: false,
      default: nil
    )
      self.name        = name
      self.description = description
      self.type        = type
      self.required    = required
      self.default     = default
    end

    # @param array [Array<Hash>]
    # @return [Array<Argument>]
    def self.from_array(array)
      return array.map { |f| self.new(**f) }
    end
  end
end
