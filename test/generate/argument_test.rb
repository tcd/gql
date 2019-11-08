require "test_helper"

class GenerateArgumentTest < Minitest::Test

  def test_single_argument_with_description_and_default
    json = <<~JSON
      {
        "name": "pirate_catchphrase",
        "description": "The catchphrase a pirate should use when making scallywags walk the plank.",
        "type": {
          "kind": "SCALAR",
          "name": "String",
          "ofType": null
        },
        "defaultValue": "Yaarrrghhhh"
      }
    JSON
    want = <<~GQL
      (
        "The catchphrase a pirate should use when making scallywags walk the plank."
        pirate_catchphrase: String = "Yaarrrghhhh"
      )
    GQL
    arg = Gql::Parse.argument(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.single_argument(arg)
    assert_equal(want, have)
  end

  def test_single_argument_without_description_and_with_default
    json = <<~JSON
      {
        "name": "pirate_catchphrase",
        "description": null,
        "type": {
          "kind": "SCALAR",
          "name": "String",
          "ofType": null
        },
        "defaultValue": "Yaarrrghhhh"
      }
    JSON
    want = '(pirate_catchphrase: String = "Yaarrrghhhh")'
    arg = Gql::Parse.argument(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.single_argument(arg)
    assert_equal(want, have)
  end

  # Possible edge case
  def test_field_with_arguments_with_comments
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
    want = <<~GQL.strip()
      """The metafield associated with the resource."""
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

  # Possible edge case
  def test_field_with_arguments_without_comments
    json = <<~JSON
      {
        "name": "metafield",
        "description": "The metafield associated with the resource.",
        "args": [
          {
            "name": "namespace",
            "description": null,
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
            "description": null,
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
    want = <<~GQL.strip()
      """The metafield associated with the resource."""
      metafield(
        namespace: String!,
        key: String!
      ): Metafield
    GQL
    field = Gql::Parse.field(JSON.parse(json, symbolize_names: true))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

end
