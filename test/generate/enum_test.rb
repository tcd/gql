require "test_helper"

class GenerateEnumTest < Minitest::Test
  def test_simple_generation
    want = <<~END
      """Options for T-Shirt size."""
      enum Size {
        Small
        Medium
        Large
      }
    END
    data = Gql::Models::Enum.new(
      name: "Size",
      description: "Options for T-Shirt size.",
      values: [
        {name: "Small"},
        {name: "Medium"},
        {name: "Large"},
      ],
    )
    have = Gql::Generate.enum(data)
    assert_equal(want, have)
  end

  def test_without_description
    want = <<~END
      enum Size {
        Small
        Medium
        Large
      }
    END
    data = Gql::Models::Enum.new(
      name: "Size",
      values: [
        {name: "Small"},
        {name: "Medium"},
        {name: "Large"},
      ],
    )
    have = Gql::Generate.enum(data)
    assert_equal(want, have)
  end
end
