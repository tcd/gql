require "test_helper"

class GenerateInterfaceTest < Minitest::Test
  def test_simple_generation
    skip()
    want = <<~END
    END
    data = Gql::Models::Interface.new()
    have = Gql::Generate.interface(data)
    assert_equal(want, have)
  end
end
