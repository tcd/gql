require "test_helper"

class ParseScalarTest < Minitest::Test

  def test_scalar
    want = Gql::Models::Scalar.new(
      name: "URL",
      description: "An RFC 3986 and RFC 3987 compliant URI string.\n\nExample value: `\"https://johns-apparel.myshopify.com\"`.\n",
    )
    have = Gql::Parse.scalar(json_file_fixture("introspection-json/scalar/url.json"))
    assert_equal(want, have)
  end

end
