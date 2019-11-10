require "test_helper"

class ParseObjectTest < Minitest::Test

  def test_object1
    want = Gql::Models::Object.new(
      name: "PublishedTranslation",
      description: "Published translation of a field of a resource.",
      fields: Gql::Models::Field.from_array([
        { name: "key", description: "Translation key.", type: "String", required: true },
        { name: "locale", description: "Translation locale.", type: "String", required: true },
        { name: "value", description: "Translation value.", type: "String" },
      ]),
    )
    have = Gql::Parse.object(json_file_fixture("introspection-json/object/published_translation.json"))
    assert_equal(want, have)
  end

  def test_object2
    want = Gql::Models::Object.new(
      name: "SEO",
      description: "SEO information.",
      fields: Gql::Models::Field.from_array([
        { name: "description", description: "SEO Description.", type: "String" },
        { name: "title", description: "SEO Title.", type: "String" },
      ]),
    )
    have = Gql::Parse.object(json_file_fixture("introspection-json/object/seo.json"))
    assert_equal(want, have)
  end

  def test_object3
    want = Gql::Models::Object.new(
      name: "UserError",
      description: "Represents an error in the input of a mutation.",
      fields: Gql::Models::Field.from_array([
        {
          name: "field",
          description: "Path to the input field which caused the error.",
          type: "String",
          list: true,
          members_required: true,
        },
        {
          name: "message",
          description: "The error message.",
          type: "String",
          required: true,
        },
      ]),
      interfaces: ["DisplayableError"],
    )
    have = Gql::Parse.object(json_file_fixture("introspection-json/object/user_error.json"))
    assert_equal(want, have)
  end

end
