require "test_helper"

class ParseInterfaceTest < Minitest::Test

  def test_interface1
    skip()
    want = Gql::Models::Interface.new()
    have = Gql::Parse.interface(json_file_fixture("introspection-json/interface1.json"))
    assert_equal(want, have)
  end

end
