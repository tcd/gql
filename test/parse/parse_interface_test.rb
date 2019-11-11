require "test_helper"

class ParseInterfaceTest < Minitest::Test

  def test_1
    want = Gql::Models::Interface.new(
      name: "LegacyInteroperability",
      description: "Interoperability metadata for types which directly correspond to a REST Admin API resource.\n",
      fields: Gql::Models::Field.from_array([{
        name: "legacyResourceId",
        description: "The ID of the corresponding resource in the REST Admin API.",
        type: "UnsignedInt64",
        required: true,
      }]),
    )
    have = Gql::Parse.interface(json_file_fixture("introspection-json/interface/legacy_interoperability.json"))
    assert_equal(want, have)
  end

end
