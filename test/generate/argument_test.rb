require "test_helper"

class GenerateArgumentTest < Minitest::Test

  def test_single_argument_with_description_and_default
    want = <<~GQL
      (
        "The catchphrase a pirate should use when making scallywags walk the plank."
        pirate_catchphrase: String = "Yaarrrghhhh"
      )
    GQL
    arg = Gql::Parse.argument(json_file_fixture("introspection-json/argument/pirate_catchphrase.json"))
    have = Gql::Generate.single_argument(arg)
    assert_equal(want, have)
  end

  def test_single_argument_without_description_and_with_default
    json = <<~JSON
      {
        "name": "pirate_catchphrase",
        "description": null,
        "type": { "kind": "SCALAR", "name": "String", "ofType": null },
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
    want = <<~GQL.strip()
      """The metafield associated with the resource."""
      metafield(
        "Container for a set of metafields (maximum of 20 characters)."
        namespace: String!,
        "Identifier for the metafield (maximum of 30 characters)."
        key: String!
      ): Metafield
    GQL
    arg = Gql::Parse.field(json_file_fixture("introspection-json/field/metafield.json"))
    have = Gql::Generate.field(arg)
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
              "ofType": { "kind": "SCALAR", "name": "String", "ofType": null }
            },
            "defaultValue": null
          },
          {
            "name": "key",
            "description": null,
            "type": {
              "kind": "NON_NULL",
              "name": null,
              "ofType": { "kind": "SCALAR", "name": "String", "ofType": null }
            },
            "defaultValue": null
          }
        ],
        "type": { "kind": "OBJECT", "name": "Metafield", "ofType": null },
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

  def test_list_argument
    want = <<~GRAPHQL.strip()
      """The details of the suggested refund. This response can be used to submit a RefundCreate mutation."""
      suggestedRefund(
        "The amount to refund for shipping. Overrides `refundShipping`."
        shippingAmount: Money,
        "Whether to refund the full shipping amount."
        refundShipping: Boolean,
        "The line items from the order to include in the refund."
        refundLineItems: [RefundLineItemInput!],
        """
        Whether a refund for all of the refundable line items on an order should be suggested.
        If `true`, the suggested refund will be formed from all refundable line items and will
        ignore any passed in `refundLineItems`.
        """
        suggestFullRefund: Boolean = false
      ): SuggestedRefund
    GRAPHQL
    field = Gql::Parse.field(json_file_fixture("introspection-json/field/order.suggested_refund.json"))
    have = Gql::Generate.field(field)
    assert_equal(want, have)
  end

end
