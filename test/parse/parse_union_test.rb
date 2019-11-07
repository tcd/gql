require "test_helper"

class ParseUnionTest < Minitest::Test

  def test_union1
    want = Gql::Models::Union.new(
      name: "DiscountCode",
      description: "A code discount.",
      types: [
        "DiscountCodeBasic",
        "DiscountCodeBxgy",
        "DiscountCodeFreeShipping",
      ],
    )
    data = Gql.parse_json(file_fixture("introspection-json/union1.json"))
    have = Gql::Parse.union(data)
    assert_equal(want, have)
  end

  def test_union2
    want = Gql::Models::Union.new(
      name: "DiscountEffect",
      description: "The type of discount that will be applied. Currently, only percentage off is supported.",
      types: ["DiscountPercentage"],
    )
    data = Gql.parse_json(file_fixture("introspection-json/union2.json"))
    have = Gql::Parse.union(data)
    assert_equal(want, have)
  end

  def test_union3
    want = Gql::Models::Union.new(
      name: "CommentEventEmbed",
      description: "The main embed of a comment event.",
      types: [
        "Order",
        "DraftOrder",
        "Customer",
        "Product",
        "ProductVariant",
      ],
    )
    data = Gql.parse_json(file_fixture("introspection-json/union3.json"))
    have = Gql::Parse.union(data)
    assert_equal(want, have)
  end

end
