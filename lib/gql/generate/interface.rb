module Gql
  module Generate
    # @param iface [Gql::Models::Interface]
    # @return [String]
    def self.interface(iface)
      fields = iface.fields.map { |f| self.field(f) }.join("\n  ")
      return %(
"#{iface.description}"
interface #{iface.name} {
  #{fields}
}

)
    end

    # def self.save_interfaces(is)
    #   File.open("interface.gql", "a") do |f|
    #     is.each { |i| f.write(self.interface(i)) }
    #   end
    # end

  end
end
