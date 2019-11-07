require "test_helper"

class ParseFieldTest < Minitest::Test

  def test_optional_value
    want = Gql::Models::Field.new(
      name: "handle",
      description: "Handle of the app.",
      type: "String",
    )
    data = Gql.parse_json(file_fixture("introspection-json/field1.json"))
    have = Gql::Parse.field(data)
    assert_equal(want, have)
  end

  def test_required_value
    want = Gql::Models::Field.new(
      name: "apiKey",
      description: "A unique application API identifier.",
      required: true,
      type: "String",
    )
    data = Gql.parse_json(file_fixture("introspection-json/field2.json"))
    have = Gql::Parse.field(data)
    assert_equal(want, have)
  end

  def test_required_list_of_required_values
    want = Gql::Models::Field.new(
      name: "features",
      description: "List of app features.",
      required: true,
      list: true,
      members_required: true,
      type: "String",
    )
    data = Gql.parse_json(file_fixture("introspection-json/field3.json"))
    have = Gql::Parse.field(data)
    assert_equal(want, have)
  end

  def test_optional_list_of_required_values
    want = Gql::Models::Field.new(
      name: "field",
      description: "Path to the input field which caused the error.",
      type: "String",
      required: false,
      list: true,
      members_required: true,
    )
    data = Gql.parse_json(file_fixture("introspection-json/field5.json"))
    have = Gql::Parse.field(data)
    assert_equal(want, have)
  end

  def test_required_list_of_optional_values
    want = Gql::Models::Field.new(
      name: "not real",
      description: "This is just to cover a possible edge case.",
      type: "String",
      required: true,
      list: true,
      members_required: false,
    )
    data = Gql.parse_json(file_fixture("introspection-json/field6.json"))
    have = Gql::Parse.field(data)
    assert_equal(want, have)
  end

  def test_optional_list_of_optional_values
    skip()
    # want = Gql::Models::Field.new()
    # data = Gql.parse_json(file_fixture("introspection-json/field?.json"))
    # have = Gql::Parse.field(data)
    # assert_equal(want, have)
  end

  def test_arguments
    want = Gql::Models::Field.new(
      name: "metafield",
      description: "The metafield associated with the resource.",
      type: "Metafield",
      args: Gql::Models::Argument.from_array([
        {
          name: "namespace",
          description: "Container for a set of metafields (maximum of 20 characters).",
          required: true,
          type: "String",
        },
        {
          name: "key",
          description: "Identifier for the metafield (maximum of 30 characters).",
          required: true,
          type: "String",
        },
      ]),
    )
    data = Gql.parse_json(file_fixture("introspection-json/field4.json"))
    have = Gql::Parse.field(data)
    assert_equal(want, have)
  end

end
