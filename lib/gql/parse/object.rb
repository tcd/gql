module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Object]
    def self.object(data)
      object = Gql::Models::Object.new()
      object.name        = data[:name]
      object.description = data[:description]
      object.fields      = data[:fields].map { |f| field(f) }
      if data[:interfaces].length.positive?
        object.interfaces = data[:interfaces].collect { |i| i[:name] }
      end
      return object
    end
  end
end
