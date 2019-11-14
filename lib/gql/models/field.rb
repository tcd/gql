module Gql
  module Models
    # Information about a GraphQL [Field](https://graphql.org/learn/schema/#object-types-and-fields).
    class Field
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
      #   True if the Field's `type` or type list is required
      #   See the [Non-Null modifier](https://graphql.org/learn/schema/#lists-and-non-null) in the GraphQL Spec.
      #   @return [Boolean]
      attr_accessor :required

      # @!attribute [rw] list
      #   Whether the Field's `type` is an array.
      #   See the [List modifier](https://graphql.org/learn/schema/#lists-and-non-null) in the GraphQL Spec.
      #   @return [Boolean]
      attr_accessor :list

      # @!attribute [rw] members_required
      #   True if the Field's `type` is an array and the members of that array are `Non-Null`.
      #   See the [Non-Null modifier](https://graphql.org/learn/schema/#lists-and-non-null) in the GraphQL Spec.
      #   @return [Boolean]
      attr_accessor :members_required

      # @!attribute [rw] args
      #   @return [Array<Gql::Models::Argument>]
      attr_accessor :args

      # @!attribute [rw] deprecation
      #   `nil` unless the Field is deprecated.
      #   See the [Non-Null modifier](https://graphql.org/learn/schema/#lists-and-non-null) in the GraphQL Spec.
      #   @return [String,nil]
      attr_accessor :deprecation


      # @param name [String]
      # @param description [String]
      # @param type [Array<String>]
      # @param required [Boolean]
      # @param list [Boolean]
      # @param members_required [Boolean]
      # @param args [Array<Gql::Models::Argument>]
      # @return [void]
      def initialize(
        name: nil,
        description: nil,
        type: nil,
        required: false,
        list: false,
        members_required: false,
        args: [],
        deprecation: nil
      )
        self.name             = name
        self.description      = description
        self.type             = type
        self.required         = required
        self.list             = list
        self.members_required = members_required
        self.args             = args
        self.deprecation      = deprecation
      end

      # @param array [Array<Hash>>]
      # @return [Array<Field>]
      def self.from_array(array)
        return array.map { |f| self.new(**f) }
      end
    end
  end
end
