module Gql
  module Generate
    # @param enum [Gql::Models::Enum]
    # @return [String]
    def self.enum(enum)
      description = enum.description ? %("""#{enum.description}"""\n) : ""
      result = <<~END
        enum #{enum.name} {
          #{enum.values.map { |v| self.enum_value(v) }.join("\n  ")}
        }
      END
      return description + result
    end

    # @param value [Hash<:name, :description>]
    # @return [String]
    def self.enum_value(value)
      description = value[:description] ? %("""#{value[:description]}"""\n  ) : ""
      return description + value[:name]
    end
  end
end
