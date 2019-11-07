require "test_helper"

class ParseInterfaceTest < Minitest::Test

  def test_interface1
    skip()
    want = Gql::Models::Interface.new()
    data = Gql.parse_json(file_fixture("introspection-json/interface1.json"))
    have = Gql::Parse.interface(data)
    assert_equal(want, have)
  end

end
