module Gql
  module Generate
    # @param field [Gql::Models::Field]
    # @return [String]
    def self.field(field)
      description = field.description ? "" : `"""#{field.description}"""\n`
      bang = field.required ? "!" : ""
      result = "#{field.name}#{self.arguments(field.args)}: #{field.type}#{bang}"
      return description + result
    end
  end
end
