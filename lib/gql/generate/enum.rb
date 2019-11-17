module Gql
  module Generate

    # @param enum [Gql::Models::Enum]
    # @return [String]
    def self.enum(enum)
      description = self.description(enum.description)
      start = "enum #{enum.name} {\n"
      values = enum.values.map { |v| self.enum_value(v) }.join("\n").indent(2)
      return description + start + values + "\n}"
    end

    # @param value [Hash<:name, :description>]
    # @return [String]
    def self.enum_value(value)
      deprecation = value[:deprecation].nil?() ? "" : %( @deprecated(reason: "#{value[:deprecation]}"))
      return self.description(value[:description]) + value[:name] + deprecation
    end

  end
end
