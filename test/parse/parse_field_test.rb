require "test_helper"

class ParseFieldTest < Minitest::Test

  def test_optional_value
    want = Gql::Models::Field.new(
      name: "handle",
      description: "Handle of the app.",
      type: "String",
    )
    have = Gql::Parse.field(json_file_fixture("introspection-json/field/handle.json"))
    assert_equal(want, have)
  end

  def test_required_value
    want = Gql::Models::Field.new(
      name: "apiKey",
      description: "A unique application API identifier.",
      required: true,
      type: "String",
    )
    have = Gql::Parse.field(json_file_fixture("introspection-json/field/api_key.json"))
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
    have = Gql::Parse.field(json_file_fixture("introspection-json/field/features.json"))
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
    have = Gql::Parse.field(json_file_fixture("introspection-json/field/field.json"))
    assert_equal(want, have)
  end

  def test_required_list_of_optional_values
    want = Gql::Models::Field.new(
      name: "not_real",
      description: "This is just to cover a possible edge case.",
      type: "String",
      required: true,
      list: true,
      members_required: false,
    )
    have = Gql::Parse.field(json_file_fixture("introspection-json/field/not_real.json"))
    assert_equal(want, have)
  end

  def test_optional_list_of_optional_values
    want = Gql::Models::Field.new(
      name: "optional_list_optional_values",
      description: "Make sure to cover edge cases",
      type: "String",
      required: false,
      list: true,
      members_required: false,
    )
    have = Gql::Parse.field(json_file_fixture("introspection-json/field/not_real_either.json"))
    assert_equal(want, have)
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
    have = Gql::Parse.field(json_file_fixture("introspection-json/field/metafield.json"))
    assert_equal(want, have)
  end

  def test_deprecation
    want = Gql::Models::Field.new(
      name: "harmonizedSystemCode",
      description: "The Harmonized System Code (or HS Tariff Code) for the variant.",
      type: "String",
      deprecation: "Use `InventoryItem.harmonized_system_code` instead.",
    )
    have = Gql::Parse.field(json_file_fixture("introspection-json/field/product_variant.harmonized_system_code.json"))
    assert_equal(want, have)
  end

end
