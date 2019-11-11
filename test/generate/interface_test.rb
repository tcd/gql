require "test_helper"

class GenerateInterfaceTest < Minitest::Test

  def test_simple_generation
    want = <<~GQL
      """Interoperability metadata for types which directly correspond to a REST Admin API resource."""
      interface LegacyInteroperability {
        """The ID of the corresponding resource in the REST Admin API."""
        legacyResourceId: UnsignedInt64!
      }
    GQL
    data = Gql::Parse.interface(json_file_fixture("introspection-json/interface/legacy_interoperability.json"))
    have = Gql::Generate.interface(data)
    # binding.pry
    assert_equal(want, have)
  end

end
