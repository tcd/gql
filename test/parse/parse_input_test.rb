require "test_helper"

class ParseInputTest < Minitest::Test

  def test_webhook_subscription_input
    want = Gql::Models::Input.new(
      name: "WebhookSubscriptionInput",
      description: "Specifies the input fields for a webhook subscription.\n",
      fields: Gql::Models::InputField.from_array([
        {
          name: "callbackUrl",
          description: "URL where the webhook subscription should send the POST request when the event occurs.",
          type: "URL",
        },
        {
          name: "format",
          description: "The format in which the webhook subscription should send the data.",
          type: "WebhookSubscriptionFormat",
        },
        {
          name: "includeFields",
          description: "The list of fields to be included in the webhook subscription.",
          type: "String",
          list: true,
          members_required: true,
        },
        {
          name: "metafieldNamespaces",
          description: "The list of namespaces for any metafields that should be included in the webhook subscription.",
          type: "String",
          list: true,
          members_required: true,
        },
      ]),
    )
    have = Gql::Parse.input(json_file_fixture("introspection-json/input/webhook_subscription_input.json"))
    assert_equal(want, have)
  end

  def test_staged_upload_target_generate_input
    want = Gql::Models::Input.new(
      name: "StagedUploadTargetGenerateInput",
      fields: Gql::Models::InputField.from_array([
        {
          name: "resource",
          type: "StagedUploadTargetGenerateUploadResource",
          required: true,
        },
        {
          name: "filename",
          type: "String",
          required: true,
        },
        {
          name: "mimeType",
          type: "String",
          required: true,
        },
        {
          name: "httpMethod",
          description: "HTTP method to be used by the Staged Upload.",
          type: "StagedUploadHttpMethodType",
          default: "PUT",
        },
      ]),
    )
    have = Gql::Parse.input(json_file_fixture("introspection-json/input/staged_upload_target_generate_input.json"))
    assert_equal(want, have)
  end

end
