module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Gql::Models::Field]
    def self.field(data)
      field = Gql::Models::Field.new()
      field.name        = data[:name]
      field.description = data[:description]
      if data[:args] && data[:args].length > 0
        field.args = data[:args].map { |arg| Gql::Parse.argument(arg) }
      end
      self.parse_type!(data, field)
      return field
    end

    # @param data [Hash<Symbol>]
    # @return [Gql::Models::Argument]
    def self.argument(data)
      arg = Gql::Models::Argument.new()
      arg.name        = data[:name]
      arg.description = data[:description]
      arg.default     = data[:defaultValue]
      self.parse_type!(data, arg)
      return arg
    end

    def self.input(data)
      input = Gql::Models::Input.new()
      input.name        = data[:name]
      input.description = data[:description]
      if data[:inputFields] && data[:inputFields].length > 0
        input.fields = data[:inputFields].map { |field| Gql::Parse.input_field(field) }
      end
      return input
    end

    def self.input_field(data)
      field = Gql::Models::InputField.new()
      field.name        = data[:name]
      field.description = data[:description]
      field.default     = data[:defaultValue]
      self.parse_type!(data, field)
      return field
    end

    # Set `type`, `list`, `required`, and `members_required` fields for an object.
    # Used to dry up code in {field} and {argument}.
    #
    # @param data [Hash<Symbol>]
    # @param object [Gql::Models::Field,Gql::Models::Argument]
    # @return [Gql::Models::Field]
    def self.parse_type!(data, object)
      if data[:type][:kind] == "LIST"
        object.list = true
        if data[:type][:ofType][:kind] == "NON_NULL"
          object.members_required = true
          object.type             = data[:type][:ofType][:ofType][:name]
        else
          object.type = data[:type][:ofType][:name]
        end
      elsif data[:type][:kind] == "NON_NULL"
        object.required = true
        if data[:type][:ofType][:kind] == "LIST"
          object.list = true
          if data[:type][:ofType][:ofType][:kind] == "NON_NULL"
            object.members_required = true
            object.type             = data[:type][:ofType][:ofType][:ofType][:name]
          else
            object.type = data[:type][:ofType][:ofType][:name]
          end
        else
          object.type = data[:type][:ofType][:name]
        end
      else
        object.type = data[:type][:name]
      end
    end
  end
end
