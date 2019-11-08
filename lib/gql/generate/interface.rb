module Gql
  module Generate
    # @param iface [Gql::Models::Interface]
    # @return [String]
    def self.interface(iface)
      description = iface.description ? %("""#{iface.description}"""\n) : ""
      fields = iface.fields.map { |f| self.field(f) }.join("\n  ")
      if x
        singleton_method
      end
      result = <<~END
        #{description}
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
