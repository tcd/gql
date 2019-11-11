require "test_helper"

class GqlTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::Gql::VERSION
  end

  def test_parse_json
    data = Gql.parse_json(file_fixture("simple.json"))
    assert_equal("value", data[:key])
  end

  def test_root_dir
    assert_equal(Dir.pwd, Gql.root_dir())
  end

  def test_data_dir
    assert_equal(File.join(Dir.pwd, "data"), Gql.data_dir())
  end

  def test_tmp_dir
    assert_equal(File.join(Dir.pwd, "tmp"), Gql.tmp_dir())
  end

  def test_write_to_file
    tmp_dir = File.join(Dir.pwd, "tmp")
    tmp_file = File.join(tmp_dir, "test", "write_to_file.txt")
    Gql.write_to_file(tmp_file, "testingtestingtesting")
    file_count = Dir["#{tmp_dir}/test/*"].count { |file| File.file?(file) }
    assert_equal(1, file_count)
    FileUtils.rm_f(tmp_file)
  end

  def test_argument_to_json
    want = { name: "Clay", description: "Wishes this was easier", type: "Programmer", required: true, list: false, members_required: false, default: nil }.to_json
    have = Gql::Models::Argument.new({ name: "Clay", description: "Wishes this was easier", type: "Programmer", required: true }).to_json
    assert_equal(want, have)
  end

end
