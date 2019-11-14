require "test_helper"

class ParseEnumTest < Minitest::Test

  def test_basic_enum_parsing
    want = Gql::Models::Enum.new(
      name: "PriceRuleTarget",
      description: "The type of lines (line_item or shipping_line) to which the price rule applies.",
      values: [
        { name: "LINE_ITEM", description: "The price rule applies to line items.", deprecation: nil },
        { name: "SHIPPING_LINE", description: "The price rule applies to shipping lines.", deprecation: nil },
      ],
    )
    have = Gql::Parse.enum(json_file_fixture("introspection-json/enum/price_rule_target.json"))
    assert_equal(want, have)
  end

  def test_values_with_no_descriptions
    want = Gql::Models::Enum.new(
      name: "DisputeType",
      description: "The possible types for a dispute.",
      values: [
        { name: "CHARGEBACK", description: nil, deprecation: nil },
        { name: "INQUIRY", description: nil, deprecation: nil },
      ],
    )
    have = Gql::Parse.enum(json_file_fixture("introspection-json/enum/dispute_type.json"))
    assert_equal(want, have)
  end

  def test_enum_with_many_values_with_descriptions
    want = Gql::Models::Enum.new(
      name: "ProductSortKeys",
      description: "The set of valid sort keys for the products query.",
      values: [
        { name: "TITLE", description: "Sort by the `title` value.", deprecation: nil },
        { name: "PRODUCT_TYPE", description: "Sort by the `product_type` value.", deprecation: nil },
        { name: "VENDOR", description: "Sort by the `vendor` value.", deprecation: nil },
        { name: "INVENTORY_TOTAL", description: "Sort by the `inventory_total` value.", deprecation: nil },
        { name: "UPDATED_AT", description: "Sort by the `updated_at` value.", deprecation: nil },
        { name: "CREATED_AT", description: "Sort by the `created_at` value.", deprecation: nil },
        { name: "PUBLISHED_AT", description: "Sort by the `published_at` value.", deprecation: nil },
        { name: "ID", description: "Sort by the `id` value.", deprecation: nil },
        { name: "RELEVANCE", description: "During a search (i.e. when the `query` parameter has been specified on the connection) this sorts the\nresults by relevance to the search term(s). When no search query is specified, this sort key is not\ndeterministic and should not be used.\n", deprecation: nil },
      ],
    )
    have = Gql::Parse.enum(json_file_fixture("introspection-json/enum/product_sort_keys.json"))
    assert_equal(want, have)
  end

  def test_deprecation
    want = Gql::Models::Enum.new(
      name: "ResourceAlertSeverity",
      values: [
        { name: "DEFAULT", description: nil, deprecation: nil },
        { name: "INFO", description: nil, deprecation: nil },
        { name: "WARNING", description: nil, deprecation: nil },
        { name: "SUCCESS", description: nil, deprecation: nil },
        { name: "CRITICAL", description: nil, deprecation: nil },
        { name: "ERROR", description: nil, deprecation: "`ERROR` severity is being deprecated in favour of `WARNING` or `CRITICAL` instead" },
      ],
    )
    have = Gql::Parse.enum(json_file_fixture("introspection-json/enum/resource_alert_severity.json"))
    assert_equal(want, have)
  end

end
