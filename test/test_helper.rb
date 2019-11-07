require "simplecov"
# https://rubydoc.info/gems/simplecov/SimpleCov/Configuration
SimpleCov.start do
  add_filter "/bin/"
  add_filter "/test/"

  add_group "Generate", "lib/gql/generate"
  add_group "Models", "lib/gql/models"
  add_group "Parse", "lib/gql/parse"

  track_files "lib/**/*.rb"
end
# if ENV["CI"] == "true"
#   require "codecov"
#   SimpleCov.formatter = SimpleCov::Formatter::Codecov
# end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "gql"

require "minitest/autorun"
require "pry"

# Return Pathname for a file used in tests.
#
# Only works when tests are run from the project root.
#
# @param path [String]
def file_fixture(path)
  return File.expand_path(File.join(File.dirname(__dir__), "test", "fixtures", "files", path))
end
