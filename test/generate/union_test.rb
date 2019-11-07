require "test_helper"

class GenerateUnionTest < Minitest::Test

  def test_simple_generation
    want = <<~END
      """Colors!"""
      union Color = Red | Green | Blue
    END
    data = Gql::Models::Union.new(
      name: "Color",
      description: "Colors!",
      types: ["Red", "Green", "Blue"],
    )
    have = Gql::Generate.union(data)
    assert_equal(want, have)
  end

  def test_without_description
    want = <<~END
      union Color = Red | Green | Blue
    END
    data = Gql::Models::Union.new(
      name: "Color",
      types: ["Red", "Green", "Blue"],
    )
    have = Gql::Generate.union(data)
    assert_equal(want, have)
  end

end
