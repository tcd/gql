module Gql
  module Generate
    # @param args [Array<Gql::Models::Argument>]
    # @return [String]
    def self.arguments(args)
      return nil if args.nil?
      return nil unless args.length.positive?
      a = []
      args.each do |arg|
        default = arg.default ? " = #{arg.default}" : ""
        bang    = arg.required ? "!" : ""
        a << %("#{arg.description}"\n#{arg.name}: #{arg.type}#{default}#{bang})
      end
      return "(\n#{a.join("\n")}\n)"
    end

#     # Not sure that this works, use {arguments}
#     # @return [String]
#     def generate_single_arg(arg)
#       default = arg.default ? " = #{arg.default}" : ""
#       bang = arg.required ? "!" : ""
#       return %(
# (
#   "#{arg.description}"
#   #{arg.name}: #{arg.type}#{default}#{bang}
# ))
#     end

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
