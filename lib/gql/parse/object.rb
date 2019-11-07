module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Object]
    def self.parse_object(data)
      object = Object.new()
      object.name        = data[:name]
      object.description = data[:description]
      object.fields      = data[:fields].map { |f| parse_field(f) }
      if data[:interfaces].length.positive?
        object.interfaces = data[:interfaces].collect { |i| i[:name] }
      end
      return object
    end
  end
end
