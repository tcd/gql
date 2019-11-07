module Gql
  module Generate
    # @param object [Gql::Models::Object]
    # @return [String]
    def self.object(object)
      description = object.description ? "" : `"""#{object.description}"""\n`
      result = <<~END
        #{description}
        type #{object.name} {

        }
      END
      return description + result
    end
  end
end
