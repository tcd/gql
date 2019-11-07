require "test_helper"

class ModelTest < Minitest::Test

  def test_argument_to_json
    want = { name: "Clay", description: "Wishes this was easier", type: "Programmer", required: true, default: nil }.to_json
    have = Gql::Argument.new({ name: "Clay", description: "Wishes this was easier", type: "Programmer", required: true }).to_json
    assert_equal(want, have)
  end

end
