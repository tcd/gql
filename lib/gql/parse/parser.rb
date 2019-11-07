module Gql
  module Parse
    # TODO: Handle `LIST -> NON_NULL` kinds.
    class Parser

      # Shopify GraphQL [Types](https://graphql.org/learn/schema/#type-system).
      # @return [Hash<Symbol>]
      attr_accessor :data

      # @return [void]
      def initialize()
        data_file = File.join(Gql.data_dir, "2019-10/graphql/admin_2019_10.json")
        # Shopify GraphQL [Types](https://graphql.org/learn/schema/#type-system).
        # @type [Hash<Symbol>]
        @data = Gql.parse_json(data_file)[:data][:__schema][:types]
      end

      # @return [Array<Hash>]
      def parse()
        res = []
        @data.each do |d|
          dat = parse_type(d)
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
          return parse_object(type)
        when "ENUM"
          return parse_enum(type)
        when "UNION"
          return parse_union(type)
        when "INTERFACE"
          return parse_interface(type)
        else
          return nil
        end
      end

    end
  end
end
