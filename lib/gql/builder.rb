module Gql
  class Builder

    # Shopify GraphQL [Types](https://graphql.org/learn/schema/#type-system).
    # @return [Hash<Symbol>]
    attr_accessor :data
    # @return [Array<Scalar>]
    attr_accessor :scalars
    # @return [Array<Object>]
    attr_accessor :objects
    # @return [Array<Enum>]
    attr_accessor :enums
    # @return [Array<Union>]
    attr_accessor :unions
    # @return [Array<Interface>]
    attr_accessor :interfaces

    # # @param path [String] Path to a JSON file with [GraphQL Introspection data](https://graphql.org/learn/introspection/).
    # @return [void]
    def initialize()
      # data_file = path
      data_file = File.join(Gql.data_dir, "shopify/admin_2019_10.json")
      self.data = Gql.parse_json(data_file)[:data][:__schema][:types]
    end

    # @return [Array<Hash>]
    def parse()
      @scalars    ||= []
      @objects    ||= []
      @enums      ||= []
      @unions     ||= []
      @interfaces ||= []
      @data.each do |type|
        case type[:kind]
        when "SCALAR"
          @scalars.append(Gql::Parse.scalar(type))
        when "OBJECT"
          @objects.append(Gql::Parse.object(type))
        when "ENUM"
          @enums.append(Gql::Parse.enum(type))
        when "UNION"
          @unions.append(Gql::Parse.union(type))
        when "INTERFACE"
          @interfaces.append(Gql::Parse.interface(type))
        else
          next
        end
      end
    end

    def write_sdl
      self.parse()
      divider = "\n# #{('=' * 78)} \n"
      filename = Gql.unique_filename(File.join(Gql.tmp_dir, "shopify.graphql"))
      File.open(filename, "a") do |f|
        f.write(divider)
        f.write("# Scalars")
        f.write(divider)
        self.scalars.each { |s| f.write(Gql::Generate.scalar(s) + "\n") }
        f.write(divider)
        f.write("# Enums")
        f.write(divider)
        self.interfaces.each { |interface| f.write(Gql::Generate.interface(interface) + "\n") }
        f.write(divider)
        f.write("# Enums")
        f.write(divider)
        self.enums.each { |enum| f.write(Gql::Generate.enum(enum) + "\n") }
        f.write(divider)
        f.write("# Unions")
        f.write(divider)
        self.unions.each { |union| f.write(Gql::Generate.union(union) + "\n") }
        f.write(divider)
        f.write("# Types")
        f.write(divider)
        self.objects.each { |obj| f.write(Gql::Generate.object(obj) + "\n") }
      end
      return filename
    end

    # @return [String]
    def write_scalars()
      filename = Gql.unique_filename(File.join(Gql.tmp_dir, "scalars.graphql"))
      File.open(filename, "a") do |f|
        self.scalars.each { |s| f.write(Gql::Generate.scalar(s) + "\n") }
      end
      return filename
    end

    # @return [String]
    def write_objects()
      filename = Gql.unique_filename(File.join(Gql.tmp_dir, "types.graphql"))
      File.open(filename, "a") do |f|
        self.objects.each { |obj| f.write(Gql::Generate.object(obj) + "\n") }
      end
      return filename
    end

    # @return [String]
    def write_enums()
      filename = Gql.unique_filename(File.join(Gql.tmp_dir, "enums.graphql"))
      File.open(filename, "a") do |f|
        self.enums.each { |enum| f.write(Gql::Generate.enum(enum) + "\n") }
      end
      return filename
    end

    # @return [String]
    def write_unions()
      filename = Gql.unique_filename(File.join(Gql.tmp_dir, "unions.graphql"))
      File.open(filename, "a") do |f|
        self.unions.each { |union| f.write(Gql::Generate.union(union) + "\n") }
      end
      return filename
    end

    # @return [String]
    def write_interfaces()
      filename = Gql.unique_filename(File.join(Gql.tmp_dir, "interfaces.graphql"))
      File.open(filename, "a") do |f|
        self.interfaces.each { |interface| f.write(Gql::Generate.interface(interface) + "\n") }
      end
      return filename
    end

  end
end
