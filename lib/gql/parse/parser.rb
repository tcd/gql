module Gql
  module Parse
    class Parser

      # Shopify GraphQL [Types](https://graphql.org/learn/schema/#type-system).
      # @return [Hash<Symbol>]
      attr_accessor :data

      # @param path [String] Path to a JSON file with [GraphQL Introspection data](https://graphql.org/learn/introspection/).
      # @return [void]
      def initialize(path)
        data_file = path
        data_file ||= File.join(Gql.data_dir, "2019-10/graphql/admin_2019_10.json")
        # Shopify GraphQL [Types](https://graphql.org/learn/schema/#type-system).
        # @type [Hash<Symbol>]
        @data = Gql.parse_json(data_file)[:data][:__schema][:types]
      end

      # @return [Array<Hash>]
      def parse()
        res = []
        @data.each do |d|
          dat = self.parse_type(d)
          res.append(dat) if dat
        end
        return res
      end

      # @param type [Hash<Symbol>]
      # @return [Scalar,Object,Enum,Union,Interface,nil]
      def parse_type(type)
        case type[:kind]
        when "SCALAR"
          return nil
        when "OBJECT"
          return Gql::Parse.object(type)
        when "ENUM"
          return Gql::Parse.enum(type)
        when "UNION"
          return Gql::Parse.union(type)
        when "INTERFACE"
          return Gql::Parse.interface(type)
        else
          return nil
        end
      end

      # @return [Array<Hash>]
      def scalars()
        res = []
        @data.each do |d|
          dat = self.parse_type(d)
          if d[:kind] == "SCALAR"
          res.append(dat)
          end
        end
        return res
      end

      # @return [Array<Object>]
      def objects()
        @data.map { |d| d[:kind] == "OBJECT" ? Gql::Parse.object(d) : nil}
      end

      # @return [Array<Enum>]
      def enums()
        @data.map { |d| d[:kind] == "ENUM" ? Gql::Parse.enum(d) : nil}
      end

      # @return [Array<Union>]
      def unions()
        @data.map { |d| d[:kind] == "UNION" ? Gql::Parse.union(d) : nil}
      end

      # @return [Array<Interface>]
      def interfaces()
        @data.map { |d| d[:kind] == "INTERFACE" ? Gql::Parse.interface(d) : nil}
      end

    end
  end
end
