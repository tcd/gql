module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Interface]
    def self.parse_interface(data)
      interface = Interface.new()
      interface.name        = data[:name]
      interface.description = data[:description]
      interface.fields      = data[:fields].map { |f| parse_field(f) }
      return interface
    end
  end
end
