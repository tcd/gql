module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Field]
    def self.field(data)

      field = Gql::Models::Field.new()
      field.name        = data[:name]
      field.description = data[:description]
      # if data&.[](:args)&.length&.positive?
      if data[:args] && data[:args].length.positive?
        field.args = data[:args].map { |arg| Gql::Parse.argument(arg) }
      end

      if data[:type][:kind] == "LIST"
        field.list = true
        if data[:type][:ofType][:kind] == "NON_NULL"
          field.members_required = true
          field.type             = data[:type][:ofType][:ofType][:name]
        else
          field.type = data[:type][:ofType][:name]
        end
      elsif data[:type][:kind] == "NON_NULL"
        field.required = true
        if data[:type][:ofType][:kind] == "LIST"
          field.list = true
          if data[:type][:ofType][:ofType][:kind] == "NON_NULL"
            field.members_required = true
            field.type             = data[:type][:ofType][:ofType][:ofType][:name]
          else
            field.type = data[:type][:ofType][:ofType][:name]
          end
        else
          field.type = data[:type][:ofType][:name]
        end
      else
        field.type = data[:type][:name]
      end

      return field
    end
  end
end
