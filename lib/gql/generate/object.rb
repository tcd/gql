module Gql
  module Generate
    # @param object [Gql::Models::Object]
    # @return [String]
    def self.object(object)
      desc = object.description ? "" : `"""#{object.description}"""`
      return <<~END
        #{description}
        type #{object.name} {

        }
      END
    end
  end
end
