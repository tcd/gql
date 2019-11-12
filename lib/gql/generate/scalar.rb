module Gql
  module Generate
    # @param scalar [Gql::Models::Scalar]
    # @return [String]
    def self.scalar(scalar)
      description = self.description(scalar.description)
      return description + "scalar #{scalar.name}"
    end
  end
end
