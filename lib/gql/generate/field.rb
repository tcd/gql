module Gql
  module Generate
    # @param field [Hash]
    # @return [String]
    def self.generate_field(f)
      bang = f[:required] ? "!" : ""
      return "#{f[:name]}#{self.generate_args(f[:args])}: #{f[:type]}#{bang}"
    end
  end
end
