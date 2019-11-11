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
  # SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  #   SimpleCov::Formatter::HTMLFormatter,
  #   # SimpleCov::Formatter::Console,
  # ])
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
  # @raise [ArgumentError] unless both arguments are strings
  # @param want [String] Expected
  # @param have [String] Actual
  def assert_equal_and_print(want, have)
    raise ArgumentError unless want.is_a?(String) && have.is_a?(String)

    clear = "\e[0m"
    bold = "\e[1m"
    red = "\e[31m"
    green = "\e[32m"

    msg = <<~END
      #{'=' * 80}
      expected:
      #{green + want + clear}
      actual:
      #{red + have + clear}
      #{'=' * 80}
    END

    # assert_equal(want, have, "#{clear}\n#{'=' * 80}\nEXPECTED:\n\n#{want}\nACTUAL:\n\n#{have}\n#{'=' * 80}\n#{red}")
    assert_equal(want, have, ("\n" + clear + msg + red))
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

class TestCase < Minitest::Test
  # Return path to a file used in tests.
  #
  # Only works when tests are run from the project root.
  #
  # @param path [String]
  # @return [String]
  def file_fixture(path)
    return File.expand_path(File.join(File.dirname(__dir__), "test", "fixtures", "files", path))
  end

  # Return JSON data from a file used for testing.
  #
  # Only works when tests are run from the project root.
  #
  # @param path [String]
  # @return [Hash<Symbol>]
  def json_file_fixture(path)
    return JSON.parse(File.read(file_fixture(path)), symbolize_names: true)
  end
end
