module Gql
  module Generate
    # @param field [Gql::Models::Field]
    # @return [String]
    def self.field(field)
      description = field.description ? %("""#{field.description}"""\n) : ""
      bang = field.required ? "!" : ""
      list_bang = field.members_required ? "!" : ""
      type = field.list ? "[#{field.type}#{list_bang}]#{bang}" : "#{field.type}#{bang}"
      result = "#{field.name}#{self.arguments(field.args)}: #{type}"
      return description + result
    end
  end
end
