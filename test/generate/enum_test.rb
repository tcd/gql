require "test_helper"

class GenerateEnumTest < Minitest::Test
  def test_simple_generation
    data = Gql::Enum.new(
      name: "Size",
      description: "Options for T-Shirt size.",
      values: [
        {name: "Small"},
        {name: "Medium"},
        {name: "Large"},
      ],
    )
  end
end
