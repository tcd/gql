module Gql
  module Generate
    # @param field [Gql::Models::Field]
    # @return [String]
    def self.field(field)
      bang = field.required ? "!" : ""
      return "#{field.name}#{self.arguments(field.args)}: #{field.type}#{bang}"
    end
  end
end
