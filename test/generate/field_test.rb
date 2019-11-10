require "test_helper"

class GenerateFieldTest < Minitest::Test

  def test_without_description
    want = "name: String"
    field = Gql::Parse.field(json_file_fixture("introspection-json/field/name.json"))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_with_description
    want = <<~GQL.strip()
      """Handle of the app."""
      handle: String
    GQL
    field = Gql::Parse.field(json_file_fixture("introspection-json/field/handle.json"))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_required
    want = <<~GQL.strip()
      """A unique application API identifier."""
      apiKey: String!
    GQL
    field = Gql::Parse.field(json_file_fixture("introspection-json/field/api_key.json"))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_required_list_with_required_members
    want = <<~GQL.strip()
      """List of app features."""
      features: [String!]!
    GQL
    field = Gql::Parse.field(json_file_fixture("introspection-json/field/features.json"))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_optional_list_with_required_members
    want = <<~GQL.strip()
      """Path to the input field which caused the error."""
      field: [String!]
    GQL
    field = Gql::Parse.field(json_file_fixture("introspection-json/field/field.json"))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_required_list_with_optional_members
    want = <<~GQL.strip()
      """This is just to cover a possible edge case."""
      not_real: [String]!
    GQL
    field = Gql::Parse.field(json_file_fixture("introspection-json/field/not_real.json"))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_field_with_arguments
    want = <<~GQL.strip()
      """The metafield associated with the resource."""
      metafield(
        "Container for a set of metafields (maximum of 20 characters)."
        namespace: String!,
        "Identifier for the metafield (maximum of 30 characters)."
        key: String!
      ): Metafield
    GQL
    field = Gql::Parse.field(json_file_fixture("introspection-json/field/metafield.json"))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

end
