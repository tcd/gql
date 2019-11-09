module Gql
  # Basic implementations of `#to_h`, `#to_hash`, and `#to_json` for serializing a class.
  module Serialization

    # @return [Hash]
    def to_h()
      hash = {}
      self.instance_variables.each do |v|
        key = v.to_s[1..].to_sym
        value = self.instance_variable_get(v)
        hash[key] = value
      end
      return hash
    end

    alias to_hash to_h

    # [Using custom to_json method in nested objects (StackOverflow)](https://stackoverflow.com/questions/6879589/using-custom-to-json-method-in-nested-objects/6880638#6880638)
    #
    # @return [Hash]
    alias as_json to_h

    # @param opts [Hash] For compatibility with `JSON.generate`. See: [ruby-doc.org](https://ruby-doc.org/stdlib-2.6.4/libdoc/json/rdoc/JSON.html#method-i-generate) and [rubydoc.info](https://www.rubydoc.info/gems/rubocop/RuboCop/Cop/Lint/ToJSON)
    # @return [String<JSON>]
    def to_json(*opts)
      # return self.to_h.reject! { |k, v| v.nil? }.to_json
      return self.to_h.to_json(opts)
    end

    # def to_json(*a)
    #   return self.as_json.to_json(*a)
    # end

  end
end
