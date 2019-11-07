module Gql
  module Parse
    # TODO: Handle List args?
    # @param data [Hash<Symbol>]
    # @return [Argument]
    def self.argument(data)
      arg = Gql::Models::Argument.new()
      arg.name        = data[:name]
      arg.description = data[:description]
      arg.default     = data[:defaultValue]
      arg.default     = data[:default] if data[:default]
      if data[:type].is_a?(String)
        arg.type = data[:type]
      elsif data[:type][:kind] == "NON_NULL"
        arg.required = true
        arg.type = data[:type][:ofType][:name]
      else
        arg.type = data[:type][:name]
      end
      return arg
    end
  end
end
