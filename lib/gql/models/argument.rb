module Gql
  module Models
    # Information about a GraphQL [Argument](https://graphql.org/learn/schema/#arguments).
    class Argument
      include Gql::Comparison
      include Gql::Serialization

      # @return [String]
      attr_accessor :name
      # @return [String, nil]
      attr_accessor :description
      # @return [String]
      attr_accessor :type
      # [See the GraphQL Spec](https://graphql.org/learn/schema/#lists-and-non-null).
      # @return [Boolean]
      attr_accessor :required
      # Whether the Argument's `type` is an array.
      # See the [List modifier](https://graphql.org/learn/schema/#lists-and-non-null) in the GraphQL Spec.
      # @return [Boolean]
      attr_accessor :list
      # True if the Argument's `type` is an array and the members of that array are `Non-Null`.
      # See the [Non-Null modifier](https://graphql.org/learn/schema/#lists-and-non-null) in the GraphQL Spec.
      # @return [Boolean]
      attr_accessor :members_required
      # @return [String, nil]
      attr_accessor :default

      # @param name [String]
      # @param description [String]
      # @param type [String]
      # @param required [Boolean]
      # @param list [Boolean]
      # @param members_required [Boolean]
      # @param default [String, nil]
      # @return [void]
      def initialize(
        name: nil,
        description: nil,
        type: nil,
        required: false,
        list: false,
        members_required: false,
        default: nil
      )
        self.name             = name
        self.description      = description
        self.type             = type
        self.required         = required
        self.list             = list
        self.members_required = members_required
        self.default          = default
      end

      # @param array [Array<Hash>]
      # @return [Array<Argument>]
      def self.from_array(array)
        return array.map { |f| self.new(**f) }
      end
    end
  end
end
