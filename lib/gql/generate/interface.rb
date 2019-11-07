module Gql
  module Generate
    def self.generate_interface(iface)
      fields = iface[:fields].map { |f| self.generate_field(f) }.join("\n  ")
      return %(
"#{iface[:description]}"
interface #{iface[:name]} {
  #{fields}
}

)
    end

    def self.save_interfaces(is)
      File.open("interface.gql", "a") do |f|
        is.each { |i| f.write(generate_interface(i)) }
      end
    end

  end
end
