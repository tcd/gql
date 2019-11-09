require "test_helper"

class ParseScalarTest < Minitest::Test

  def test_scalar
    want = Gql::Models::Scalar.new(
      name: "URL",
      description: "An RFC 3986 and RFC 3987 compliant URI string.\n\nExample value: `\"https://johns-apparel.myshopify.com\"`.\n",
    )
    data = Gql.parse_json(file_fixture("introspection-json/scalar/url.json"))
    have = Gql::Parse.scalar(data)
    assert_equal_and_print(want, have)
  end

end
