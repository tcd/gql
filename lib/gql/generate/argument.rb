module Gql
  module Generate

    # @param args [Array<Gql::Models::Argument>]
    # @return [String]
    def self.arguments(args)
      return nil if args.nil?
      return nil unless args.length.positive?
      has_descriptions = false
      a = []
      args.each do |arg|
        has_descriptions = true if arg.description
        a.append(self.argument(arg))
      end
      if has_descriptions || args.length > 1
        return "(\n#{a.join(",\n").indent(2)}\n)"
      else
        return "(#{a.join(",\n")})"
      end
    end

    # @param arg [Gql::Models::Argument]
    # @return [String]
    def self.argument(arg)
      description = self.argument_description(arg.description)
      bang        = arg.required ? "!" : ""
      list_bang   = arg.members_required ? "!" : ""
      type        = arg.list ? "[#{arg.type}#{list_bang}]#{bang}" : "#{arg.type}#{bang}"
      default     = ""

      if arg.default
        if arg.type == "String"
          default = %( = "#{arg.default}")
        else
          default = " = #{arg.default}"
        end
      end

      result = [description, arg.name, ": ", type, default].compact.join("")
      return result
    end

    # Not sure that this works, use {arguments}
    # @param arg [Gql::Models::Argument]
    # @return [String]
    def self.single_argument(arg)
      default = ""
      if arg.default
        if arg.type == "String"
          default = %( = "#{arg.default}")
        else
          default = " = #{arg.default}"
        end
      end
      bang = arg.required ? "!" : ""
      if arg.description
        result = <<~END
          (
            "#{arg.description}"
            #{arg.name}: #{arg.type}#{default}#{bang}
          )
        END
      else
        result = "(#{arg.name}: #{arg.type}#{default}#{bang})"
      end
      return result
    end

  end
end
