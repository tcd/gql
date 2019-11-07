module Gql
  module Parse
    # TODO: Handle List args?
    # @param data [Hash<Symbol>]
    # @return [Argument]
    def self.parse_argument(data)
      arg = Argument.new()
      arg.name        = data[:name]
      arg.description = data[:description]
      arg.default     = data[:defaultValue]
      if data[:type][:kind] == "NON_NULL"
        arg.required = true
        arg.type = data[:type][:ofType][:name]
      else
        arg.type = data[:type][:name]
      end
      return arg
    end
  end
end
