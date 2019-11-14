module Gql
  module Generate
    # @param object [Gql::Models::Object]
    # @return [String]
    def self.object(object)
      description = self.description(object.description)
      interfaces  = object.interfaces.length == 0 ? "" : " implements #{object.interfaces.join(' & ')}"

      start  = description + "type " + object.name + interfaces + " {\n"
      middle = object.fields.map { |f| self.field(f) }.join("\n")
      ending = "\n}"

      return start + middle.indent(2) + ending
    end
  end
end
