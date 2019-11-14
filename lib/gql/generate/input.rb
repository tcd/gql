module Gql
  module Generate
    # @param input [Gql::Models::Input]
    # @return [String]
    def self.input(input)
      start  = self.description(input.description) + "input " + input.name + " {\n"
      middle = input.fields.map { |f| self.input_field(f) }.join("\n")
      ending = "\n}"
      return start + middle.indent(2) + ending
    end

    # @param field [Gql::Models::InputField]
    # @return [String]
    def self.input_field(field)
      description = self.description(field.description)
      bang        = field.required ? "!" : ""
      list_bang   = field.members_required ? "!" : ""
      type        = field.list ? "[#{field.type}#{list_bang}]#{bang}" : "#{field.type}#{bang}"
      default     = field.default ? " = #{field.default}" : ""

      result = [description, field.name, ": ", type, default].compact.join("")
      return result
    end

  end
end
