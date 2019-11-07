require "test_helper"

class ModelTest < Minitest::Test

  # def test_argument_defaults
  #   data = Gql::Models::Argument.new()
  #   assert_nil(data.name)
  #   assert_nil(data.description)
  #   assert_nil(data.type)
  #   refute(data.required)
  #   assert_nil(data.default)
  # end
  #
  # def test_argument_constructor
  #   data = Gql::Models::Argument.new(
  #     name: "Pirate Catchphrase",
  #     description: "The catchphrase a pirate should use when making scallywags walk the plank.",
  #     type: "String",
  #     required: true,
  #     default: "Yaarrrghhhh",
  #   )
  #   assert_equal("Pirate Catchphrase", data.name)
  #   assert_equal("The catchphrase a pirate should use when making scallywags walk the plank.", data.description)
  #   assert_equal("String", data.type)
  #   assert(data.required)
  #   assert_equal("Yaarrrghhhh", data.default)
  # end
  #
  # def test_enum_defaults
  #   data = Gql::Models::Enum.new()
  #   assert_nil(data.name)
  #   assert_nil(data.description)
  #   assert_equal([], data.values)
  # end
  #
  # def test_enum_constructor
  #   data = Gql::Models::Enum.new(
  #     name: "Size",
  #     description: "Options for T-Shirt size.",
  #     values: [
  #       {name: "Small"},
  #       {name: "Medium"},
  #       {name: "Large"},
  #     ],
  #   )
  #   assert_equal("Size", data.name)
  #   assert_equal("Options for T-Shirt size.", data.description)
  #   assert_equal(["Small", "Meduim", "Large"], data.values.collect {|v|v[:name]})
  # end
  #
  # def test_field_defaults
  #   data = Gql::Models::Field.new()
  #   assert_equal(nil, data.name)
  #   assert_equal(nil, data.description)
  #   assert_equal(nil, data.type)
  #   assert_equal(false, data.required)
  #   assert_equal(false, data.list)
  #   assert_equal(false, data.members_required)
  #   assert_equal([], data.args)
  # end

end
