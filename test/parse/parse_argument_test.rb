require "test_helper"

class ParseArgumentTest < Minitest::Test

  def test_parse_arg1
    want = Gql::Models::Argument.new(
      name: "Pirate Catchphrase",
      description: "The catchphrase a pirate should use when making scallywags walk the plank.",
      type: "String",
      default: "Yaarrrghhhh",
    )
    data = Gql.parse_json(file_fixture("introspection-json/argument1.json"))
    have = Gql::Parse.argument(data)
    assert_equal(want, have)
  end

end
