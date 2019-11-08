require "test_helper"

class GenerateEnumTest < Minitest::Test

  def test_with_description
    want = <<~GQL
      """Options for T-Shirt size."""
      enum Size {
        Small
        Medium
        Large
      }
    GQL
    have = Gql::Generate.enum(Gql::Models::Enum.new(
      name: "Size",
      description: "Options for T-Shirt size.",
      values: [
        {name: "Small"},
        {name: "Medium"},
        {name: "Large"},
      ],
    ))
    assert_equal(want, have)
  end

  def test_without_description
    want = <<~GQL
      enum Size {
        Small
        Medium
        Large
      }
    GQL
    have = Gql::Generate.enum(Gql::Models::Enum.new(
      name: "Size",
      values: [
        {name: "Small"},
        {name: "Medium"},
        {name: "Large"},
      ],
    ))
    assert_equal(want, have)
  end

end
