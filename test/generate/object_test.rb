require "test_helper"

class GenerateObjectTest < Minitest::Test
  def test_simple_generation
    skip()
    want = <<~END
    END
    data = Gql::Models::Object.new()
    have = Gql::Generate.object(data)
    assert_equal(want, have)
  end
end
