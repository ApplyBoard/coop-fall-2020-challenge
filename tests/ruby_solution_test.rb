require_relative "../solution_ruby"
require "test/unit"
require "json"

class TestChallenge < Test::Unit::TestCase
  def test_solution
    test_input = JSON.parse(File.read('tests/test_input.json'))
    expected_output = JSON.parse(File.read('tests/expected_output.json'))
    assert_equal(solution(test_input), expected_output)
  end
end
