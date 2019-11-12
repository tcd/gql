require "test_helper"

class GenerateInputTest < Minitest::Test

  def test_webhook_subscription_input
    want = File.read(file_fixture("graphql/input/webhook_subscription_input.graphql")).strip
    have = Gql::Generate.input(Gql::Parse.input(json_file_fixture("introspection-json/input/webhook_subscription_input.json")))
    assert_equal(want, have)
  end

  def test_staged_upload_target_generate_input
    want = File.read(file_fixture("graphql/input/staged_upload_target_generate_input.graphql")).strip
    have = Gql::Generate.input(Gql::Parse.input(json_file_fixture("introspection-json/input/staged_upload_target_generate_input.json")))
    assert_equal_and_print(want, have)
  end

end
