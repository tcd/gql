module Gql; end

Dir.glob(File.join(__dir__, "gql", "/*.rb")).sort.each { |file| require file }
Dir.glob(File.join(__dir__, "gql", "/models/*.rb")).sort.each { |file| require file }
Dir.glob(File.join(__dir__, "gql", "/parse/*.rb")).sort.each { |file| require file }
