module Gql
  module Generate
    # @param field [Gql::Models::Field]
    # @return [String]
    def self.field(field)
      description = self.description(field.description)
      bang        = field.required ? "!" : ""
      list_bang   = field.members_required ? "!" : ""
      type        = field.list ? "[#{field.type}#{list_bang}]#{bang}" : "#{field.type}#{bang}"
      deprecation = field.deprecation.nil?() ? "" : %( @deprecated(reason: "#{field.deprecation}"))

      result = [description, field.name, self.arguments(field.args), ": ", type, deprecation].compact.join("")
      return result
    end
  end
end
