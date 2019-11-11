require "test_helper"

class ParseArgumentTest < Minitest::Test

  def test_basic_argument
    want = Gql::Models::Argument.new(
      name: "pirate_catchphrase",
      description: "The catchphrase a pirate should use when making scallywags walk the plank.",
      type: "String",
      default: "Yaarrrghhhh",
    )
    have = Gql::Parse.argument(json_file_fixture("introspection-json/argument/pirate_catchphrase.json"))
    assert_equal(want, have)
  end

  def test_with_complex_description
    want = Gql::Models::Argument.new(
      name: "query",
      description: "Supported filter parameters:\n - `cart_token`\n - `channel_id`\n - `chargeback_status`\n - `checkout_token`\n - `created_at`\n - `credit_card_last4`\n - `customer_id`\n - `discount_code`\n - `email`\n - `financial_status`\n - `fraud_protection_level`\n - `fulfillment_status`\n - `location_id`\n - `processed_at`\n - `reference_location_id`\n - `risk_level`\n - `sales_channel`\n - `source_name`\n - `status`\n - `tag`\n - `test`\n - `updated_at`\n\nSee the detailed [search syntax](https://help.shopify.com/api/getting-started/search-syntax).\n",
      type: "String",
    )
    have = Gql::Parse.argument(json_file_fixture("introspection-json/argument/customer.orders.query.json"))
    assert_equal(want, have)
  end

  def test_list_argument
    want = Gql::Models::Argument.new(
      name: "refundLineItems",
      description: "The line items from the order to include in the refund.",
      type: "RefundLineItemInput",
      required: false,
      list: true,
      members_required: true,
    )
    have = Gql::Parse.argument(json_file_fixture("introspection-json/argument/order.refund_line_items.json"))
    assert_equal(want, have)
  end

end
