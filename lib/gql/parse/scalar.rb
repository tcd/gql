module Gql
  module Parse
    # @param data [Hash<Symbol>]
    # @return [Gql::Models::Scalar]
    def self.scalar(data)
      return Gql::Models::Scalar.new(
        name: data[:name],
        description: data[:description],
      )
    end
  end
end
