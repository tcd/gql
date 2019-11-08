require "test_helper"

class GenerateUnionTest < Minitest::Test

  def test_with_description
    want = <<~GQL
      """Colors!"""
      union Color = Red | Green | Blue
    GQL
    have = Gql::Generate.union(Gql::Models::Union.new(
      name: "Color",
      description: "Colors!",
      types: ["Red", "Green", "Blue"],
    ))
    assert_equal(want, have)
  end

  def test_without_description
    want = <<~GQL
      union Color = Red | Green | Blue
    GQL
    have = Gql::Generate.union(Gql::Models::Union.new(
      name: "Color",
      types: ["Red", "Green", "Blue"],
    ))
    assert_equal(want, have)
  end

end
