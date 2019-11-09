require "json"
require "test_helper"
require "pry"

class GenerateObjectTest < Minitest::Test

  def test_basic_object
    null = nil
    json = {
        "kind": "OBJECT",
        "name": "Person",
        "description": null,
        "accessRestricted": false,
        "accessRestrictedReason": null,
        "fields": [
          {
            "name": "name",
            "description": null,
            "args": [],
            "type": {
              "kind": "SCALAR",
              "name": "String",
              "ofType": null
            },
            "isDeprecated": false,
            "deprecationReason": null,
            "accessRestricted": false,
            "accessRestrictedReason": null,
            "requiredAccess": null
          }
        ],
        "inputFields": null,
        "interfaces": [],
        "enumValues": null,
        "possibleTypes": null,
        "requiredAccess": null,
      }.to_json
    want = <<~GQL.strip()
      type Person {
        name: String
      }
    GQL
    object = Gql::Parse.object(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.object(object)
    assert_equal_and_print(want, have)
  end

  def test_generate_object
    want = <<~GQL.strip()
      """SEO information."""
      type SEO {
        """SEO Description."""
        description: String,
        """SEO Title."""
        title: String
      }
    GQL
    object = Gql::Parse.object(Gql.parse_json(file_fixture("introspection-json/object/object2.json")))
    have = Gql::Generate.object(object)
    assert_equal(want, have)
  end

  def test_single_interface
    want = <<~GQL.strip()
      """Represents an error in the input of a mutation."""
      type UserError implements DisplayableError {
        """Path to the input field which caused the error."""
        field: [String!],
        """The error message."""
        message: String!
      }
    GQL
    object = Gql::Parse.object(Gql.parse_json(file_fixture("introspection-json/object/object3.json")))
    have = Gql::Generate.object(object)
    assert_equal(want, have)
  end

end
