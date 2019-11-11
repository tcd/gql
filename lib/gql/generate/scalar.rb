module Gql
  module Generate
    # @param scalar [Gql::Models::Scalar]
    # @return [String]
    def self.scalar(scalar)
      description = scalar.description ? %("""#{scalar.description}"""\n) : ""
      return description + "scalar #{scalar.name}"
    end
  end
end
