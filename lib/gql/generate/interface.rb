module Gql
  module Generate
    # @param iface [Gql::Models::Interface]
    # @return [String]
    def self.interface(iface)
      description = self.description(iface.description)
      fields = iface.fields.map { |f| self.field(f) }.join("\n").indent(2)
      result = <<~END
        interface #{iface.name} {
        #{fields}
        }
      END
      return description + result
    end

    # def self.save_interfaces(is)
    #   File.open("interface.gql", "a") do |f|
    #     is.each { |i| f.write(self.interface(i)) }
    #   end
    # end

  end
end
