require "test_helper"

class GenerateFieldTest < Minitest::Test

  def test_without_description
    json = <<~JSON
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
    JSON
    want = "name: String"
    field = Gql::Parse.field(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_with_description
    skip()
    json = <<~JSON
      {
        "name": "name",
        "description": "Handle of the app.",
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
    JSON
    want = <<~GQL.strip
      """Handle of the app."""
      handle: String
    GQL
    field = Gql::Parse.field(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_required
    json = <<~JSON
      {
        "name": "apiKey",
        "description": "A unique application API identifier.",
        "args": [],
        "type": {
          "kind": "NON_NULL",
          "name": null,
          "ofType": {
            "kind": "SCALAR",
            "name": "String",
            "ofType": null
          }
        },
        "isDeprecated": false,
        "deprecationReason": null,
        "accessRestricted": false,
        "accessRestrictedReason": null,
        "requiredAccess": null
      }
    JSON
    want = <<~GQL.strip
      """A unique application API identifier."""
      apiKey: String!
    GQL
    field = Gql::Parse.field(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_required_list_with_required_members
    json = <<~JSON
      {
        "name": "features",
        "description": "List of app features.",
        "args": [],
        "type": {
          "kind": "NON_NULL",
          "name": null,
          "ofType": {
            "kind": "LIST",
            "name": null,
            "ofType": {
              "kind": "NON_NULL",
              "name": null,
              "ofType": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            }
          }
        },
        "isDeprecated": false,
        "deprecationReason": null,
        "accessRestricted": false,
        "accessRestrictedReason": null,
        "requiredAccess": null
      }
    JSON
    want = <<~GQL.strip
      """List of app features."""
      features: [String!]!
    GQL
    field = Gql::Parse.field(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_optional_list_with_required_members
    json = <<~JSON
      {
        "name": "field",
        "description": "Path to the input field which caused the error.",
        "args": [],
        "type": {
          "kind": "LIST",
          "name": null,
          "ofType": {
            "kind": "NON_NULL",
            "name": null,
            "ofType": {
              "kind": "SCALAR",
              "name": "String",
              "ofType": null
            }
          }
        },
        "isDeprecated": false,
        "deprecationReason": null,
        "accessRestricted": false,
        "accessRestrictedReason": null,
        "requiredAccess": null
      }
    JSON
    want = <<~GQL.strip
      """Path to the input field which caused the error."""
      field: [String!]
    GQL
    field = Gql::Parse.field(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_required_list_with_optional_members
    json = <<~JSON
      {
        "name": "not_real",
        "description": "This is just to cover a possible edge case.",
        "args": [],
        "type": {
          "kind": "NON_NULL",
          "name": null,
          "ofType": {
            "kind": "LIST",
            "name": null,
            "ofType": {
              "kind": "SCALAR",
              "name": "String",
              "ofType": null
            }
          }
        },
        "isDeprecated": false,
        "deprecationReason": null,
        "accessRestricted": false,
        "accessRestrictedReason": null,
        "requiredAccess": null
      }
    JSON
    want = <<~GQL.strip
      """This is just to cover a possible edge case."""
      not_real: [String]!
    GQL
    field = Gql::Parse.field(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

  def test_field_with_arguments
    skip()
    json = <<~JSON
      {
        "name": "metafield",
        "description": "The metafield associated with the resource.",
        "args": [
          {
            "name": "namespace",
            "description": "Container for a set of metafields (maximum of 20 characters).",
            "type": {
              "kind": "NON_NULL",
              "name": null,
              "ofType": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            "defaultValue": null
          },
          {
            "name": "key",
            "description": "Identifier for the metafield (maximum of 30 characters).",
            "type": {
              "kind": "NON_NULL",
              "name": null,
              "ofType": {
                "kind": "SCALAR",
                "name": "String",
                "ofType": null
              }
            },
            "defaultValue": null
          }
        ],
        "type": {
          "kind": "OBJECT",
          "name": "Metafield",
          "ofType": null
        },
        "isDeprecated": false,
        "deprecationReason": null,
        "accessRestricted": false,
        "accessRestrictedReason": null,
        "requiredAccess": null
      }
    JSON
    want = <<~GQL.strip
      """This is just to cover a possible edge case."""
      metafield(
        "Container for a set of metafields (maximum of 20 characters)."
        namespace: String!,
        "Identifier for the metafield (maximum of 30 characters)."
        key: String!
      ): Metafield
    GQL
    field = Gql::Parse.field(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

end
