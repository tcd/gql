module Gql
  module Generate

    # Turn a string into a [GraphQL Doc comment](https://graphql.github.io/graphql-spec/June2018/#sec-Descriptions).
    #
    # @param description [String,nil]
    # @return [String]
    def self.description(description)
      return "" if description.nil?()
      description.strip!()
      if description.include?("\n")
        return <<~END
          """
          #{description}
          """
        END
      end
      return %("""#{description.strip}"""\n)
    end

    # Same as {description}, but uses single quotes if possible.
    #
    # @param description [String,nil]
    # @return [String]
    def self.argument_description(description)
      return "" if description.nil?()
      description.strip!()
      if description.include?("\n")
        return <<~END
          """
          #{description}
          """
        END
      end
      return %("#{description.strip}"\n)
    end

  end
end
