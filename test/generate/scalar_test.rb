require "test_helper"

class GenerateScalarTest < Minitest::Test

  def test_1
    want = File.read(file_fixture("graphql/url.graphql")).strip
    have = Gql::Generate.scalar(Gql::Parse.scalar(json_file_fixture("introspection-json/scalar/url.json")))
    assert_equal(want, have)
  end

end
