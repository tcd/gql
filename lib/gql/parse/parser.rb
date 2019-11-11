module Gql
  module Parse
    class Parser

      # Shopify GraphQL [Types](https://graphql.org/learn/schema/#type-system).
      # @return [Hash<Symbol>]
      attr_accessor :data

      # # @param path [String] Path to a JSON file with [GraphQL Introspection data](https://graphql.org/learn/introspection/).
      # @return [void]
      def initialize()
        # data_file = path
        data_file = File.join(Gql.data_dir, "shopify/admin_2019_10.json")
        # Shopify GraphQL [Types](https://graphql.org/learn/schema/#type-system).
        # @type [Hash<Symbol>]
        @data = Gql.parse_json(data_file)[:data][:__schema][:types]
      end

      # @return [Array<Hash>]
      def parse()
        res = {
          objects: [],
          scalars: [],
          interfaces: [],
          enums: [],
          unions: [],
        }
        @data.each do |d|
          case type[:kind]
          when "SCALAR"
            res[:scalars].append(Gql::Parse.scalar(type))
          when "OBJECT"
            res[:objects].append(Gql::Parse.object(type))
          when "ENUM"
            res[:enums].append(Gql::Parse.enum(type))
          when "UNION"
            res[:unions].append(Gql::Parse.union(type))
          when "INTERFACE"
            res[:interfaces].append(Gql::Parse.interface(type))
          else
            next
          end
        end
        return res
      end

      # @return [Array<Scalar>]
      def scalars()
        return @data.map { |d| d[:kind] == "SCALAR" ? Gql::Parse.scalar(d) : nil }.compact
      end

      # @return [String]
      def write_scalars()
        filename = Gql.unique_filename(File.join(Gql.tmp_dir, "scalars.graphql"))
        File.open(filename, "a") do |f|
          self.scalars().each do |s|
            f.write(Gql::Generate.scalars(s) + "\n\n")
          end
        end
        return filename
      end

      # @return [Array<Object>]
      def objects()
        return @data.map { |d| d[:kind] == "OBJECT" ? Gql::Parse.object(d) : nil }.compact
      end

      # @return [String]
      def write_objects()
        filename = Gql.unique_filename(File.join(Gql.tmp_dir, "types.graphql"))
        objects = self.objects()
        File.open(filename, "a") do |f|
          objects.each do |obj|
            f.write(Gql::Generate.object(obj) + "\n\n")
          end
        end
        return filename
      end

      # @return [Array<Enum>]
      def enums()
        return @data.map { |d| d[:kind] == "ENUM" ? Gql::Parse.enum(d) : nil }.compact
      end

      # @return [Array<Union>]
      def unions()
        return @data.map { |d| d[:kind] == "UNION" ? Gql::Parse.union(d) : nil }.compact
      end

      # @return [Array<Interface>]
      def interfaces()
        return @data.map { |d| d[:kind] == "INTERFACE" ? Gql::Parse.interface(d) : nil }.compact
      end

    end
  end
end
