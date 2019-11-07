require "test_helper"

class GenerateFieldTest < Minitest::Test
  def test_simple_generation
    skip()
    want = <<~END
    END
    data = Gql::Models::Field.new()
    have = Gql::Generate.field(data)
    assert_equal(want, have)
  end
end
