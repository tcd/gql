require "test_helper"

class GenerateArgumentTest < Minitest::Test
  def test_simple_generation
    skip()
    want = <<~END
    END
    data = Gql::Models::Argument.new()
    have = Gql::Generate.arguments([data])
    assert_equal(want, have)
  end
end
