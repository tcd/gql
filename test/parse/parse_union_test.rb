require "test_helper"

class ParseUnionTest < Minitest::Test

  def test_union1
    want = Gql::Models::Union.new(
      name: "DiscountCode",
      description: "A code discount.",
      types: ["DiscountCodeBasic", "DiscountCodeBxgy", "DiscountCodeFreeShipping"],
    )
    have = Gql::Parse.union(json_file_fixture("introspection-json/union/discount_code.json"))
    assert_equal(want, have)
  end

  def test_union2
    want = Gql::Models::Union.new(
      name: "DiscountEffect",
      description: "The type of discount that will be applied. Currently, only percentage off is supported.",
      types: ["DiscountPercentage"],
    )
    have = Gql::Parse.union(json_file_fixture("introspection-json/union/discount_effect.json"))
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
    have = Gql::Parse.union(json_file_fixture("introspection-json/union/common_event_embed.json"))
    assert_equal(want, have)
  end

end
