module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Interface]
    def self.interface(data)
      interface = Gql::Models::Interface.new()
      interface.name        = data[:name]
      interface.description = data[:description]
      interface.fields      = data[:fields].map { |f| Gql::Parse.field(f) }
      return interface
    end
  end
end
