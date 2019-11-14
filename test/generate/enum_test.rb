require "test_helper"

class GenerateEnumTest < Minitest::Test

  def test_with_description
    want = <<~GQL.strip()
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
    want = <<~GQL.strip()
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

  def test_generating_customer_marketing_opt_in_level
    want = File.read(file_fixture("graphql/enum/customer_marketing_opt_in_level.graphql")).strip
    have = Gql::Generate.enum(Gql::Parse.enum(json_file_fixture("introspection-json/enum/customer_marketing_opt_in_level.json")))
    assert_equal(want, have)
  end

  def test_deprecation
    want = File.read(file_fixture("graphql/enum/resource_alert_severity.graphql")).strip
    have = Gql::Generate.enum(Gql::Parse.enum(json_file_fixture("introspection-json/enum/resource_alert_severity.json")))
    assert_equal(want, have)
  end

end
