require "simplecov"
require "simplecov-console"
# https://rubydoc.info/gems/simplecov/SimpleCov/Configuration
SimpleCov.start do
  add_filter "/bin/"
  add_filter "/test/"

  add_group "Generate", "lib/gql/generate"
  add_group "Models", "lib/gql/models"
  add_group "Parse", "lib/gql/parse"

  track_files "lib/**/*.rb"
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::Console,
  ]
end
# if ENV["CI"] == "true"
#   require "codecov"
#   SimpleCov.formatter = SimpleCov::Formatter::Codecov
# end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "gql"

require "minitest/autorun"
require "minitest/focus"
require "minitest/reporters"
Minitest::Reporters.use!([
  Minitest::Reporters::DefaultReporter.new(color: true),
  # Minitest::Reporters::SpecReporter.new,
])

module MiniTest::Assertions
  # `assert_equal` with a default message.
  def assert_equal_and_print(want, have)
    assert_equal(want, have, "\n#{'=' * 80}\nexpected:\n#{want}\nactual:\n#{have}\n#{'=' * 80}\n")
  end
end

# class TestCase < Minitest::Test
# Return path to a file used in tests.
#
# @param path [String]
# @return [String]
def file_fixture(path)
  return File.expand_path(File.join(File.dirname(__dir__), "test", "fixtures", "files", path))
end

# Return JSON data from a file used for testing.
#
# @param path [String]
# @return [Hash<Symbol>]
def json_file_fixture(path)
  return JSON.parse(File.read(file_fixture(path)), symbolize_names: true)
end
