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
        description = ""
        if arg.description
          has_descriptions = true
          description = %("#{arg.description}"\n  )
        end
        bang = arg.required ? "!" : ""
        default = ""
        if arg.default
          if arg.type == "String"
            default = %( = "#{arg.default}")
          else
            default = " = #{arg.default}"
          end
        end
        a.append("  #{description}#{arg.name}: #{arg.type}#{default}#{bang}")
      end
      if has_descriptions || args.length > 1
        return "(\n#{a.join(",\n")}\n)"
      else
        return "(#{a.join(",\n")})"
      end
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
      # default = arg.default ? " = #{arg.default}" : ""
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

#     # Not sure that this works, use {generate_args}
#     # @return [String]
#     def generate_multi_arg(args)
#       a = []
#       args.each do |arg|
#         default = arg.default ? " = #{arg.default}" : ""
#         bang = arg.required ? "!" : ""
#         a << %("#{arg.description}"\n#{arg.name}: #{arg.type}#{default}#{bang})
#       end
#       return "(\n#{a.join("\n")}\n)"
#     end

  end
end
