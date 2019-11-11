require "test_helper"

class GenerateObjectTest < Minitest::Test

  def test_objet_with_no_descriptions
    want = <<~GQL.strip()
      type Person {
        name: String
      }
    GQL
    object = Gql::Parse.object(json_file_fixture("introspection-json/object/person.json"))
    have = Gql::Generate.object(object)
    assert_equal(want, have)
  end

  def test_generate_object
    want = <<~GQL.strip()
      """SEO information."""
      type SEO {
        """SEO Description."""
        description: String,
        """SEO Title."""
        title: String
      }
    GQL
    object = Gql::Parse.object(json_file_fixture("introspection-json/object/seo.json"))
    have = Gql::Generate.object(object)
    assert_equal(want, have)
  end

  def test_single_interface
    want = <<~GQL.strip()
      """Represents an error in the input of a mutation."""
      type UserError implements DisplayableError {
        """Path to the input field which caused the error."""
        field: [String!],
        """The error message."""
        message: String!
      }
    GQL
    object = Gql::Parse.object(json_file_fixture("introspection-json/object/user_error.json"))
    have = Gql::Generate.object(object)
    assert_equal(want, have)
  end

  def test_mailing_address
    want = File.read(file_fixture("graphql/mailing_address.graphql")).strip
    have = Gql::Generate.object(Gql::Parse.object(json_file_fixture("introspection-json/object/mailing_address.json")))
    assert_equal(want, have)
  end

  def test_order
    skip("Need to handle multiline argument descriptions for this test to pass")
    want = File.read(file_fixture("graphql/order.graphql")).strip
    have = Gql::Generate.object(Gql::Parse.object(json_file_fixture("introspection-json/object/order.json")))
    # File.open(File.join(Gql.tmp_dir, "out/order.graphql"), "a") do |f|
    #   f.write(have)
    # end
    assert_equal(want, have)
  end

end
