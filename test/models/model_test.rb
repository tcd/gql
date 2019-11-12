require "test_helper"

class ModelTest < Minitest::Test

  def test_argument_constructor
    data = Gql::Models::Argument.new(
      name: "pirate_catchphrase",
      description: "The catchphrase a pirate should use when making scallywags walk the plank.",
      type: "String",
      required: true,
      default: "Yaarrrghhhh",
    )
    assert_equal("pirate_catchphrase", data.name)
    assert_equal("The catchphrase a pirate should use when making scallywags walk the plank.", data.description)
    assert_equal("String", data.type)
    assert(data.required)
    assert_equal("Yaarrrghhhh", data.default)
  end

  def test_enum_constructor
    data = Gql::Models::Enum.new(
      name: "Size",
      description: "Options for T-Shirt size.",
      values: [
        {name: "Small"},
        {name: "Medium"},
        {name: "Large"},
      ],
    )
    assert_equal("Size", data.name)
    assert_equal("Options for T-Shirt size.", data.description)
    assert_equal(["Small", "Medium", "Large"], data.values.collect { |v| v[:name] })
  end

end
