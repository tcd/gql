require "test_helper"

class ParseArgumentTest < Minitest::Test

  def test_basic_argument
    want = Gql::Models::Argument.new(
      name: "pirate_catchphrase",
      description: "The catchphrase a pirate should use when making scallywags walk the plank.",
      type: "String",
      default: "Yaarrrghhhh",
    )
    data = json_file_fixture("introspection-json/argument/pirate_catchphrase.json")
    have = Gql::Parse.argument(data)
    assert_equal(want, have)
  end

end
