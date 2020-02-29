lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gql/version"

Gem::Specification.new do |spec|
  spec.name          = "gql"
  spec.version       = Gql::VERSION
  spec.authors       = ["Clay Dunston"]
  spec.email         = ["dunstontc@gmail.com"]

  spec.summary       = "Extract data from GraphQL introspection JSON."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/tc/gql"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = spec.homepage
  spec.metadata["yard.run"]        = "yri" # use "yard" to build full HTML docs.

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "coveralls", "~> 0.8.23"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-focus", "~> 1.1"
  spec.add_development_dependency "minitest-reporters", "~> 1.4"
  spec.add_development_dependency "pry", "~> 0.12.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-console"
end
