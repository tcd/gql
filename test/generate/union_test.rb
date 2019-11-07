require "test_helper"

class GenerateUnionTest < Minitest::Test
  def test_simple_generation
    skip()
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
    # binding.pry
    assert_equal(want, have)
  end
end
