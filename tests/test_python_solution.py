import json
from solution_python import solution


def test_solution():
    test_input = {}
    expected_response = {}

    with open('tests/test_input.json', 'rb') as challenge_json:
        test_input = json.load(challenge_json)

    with open('tests/expected_output.json', 'rb') as complete_json:
        expected_response = json.load(complete_json)

    actual_response = solution(test_input)

    assert actual_response == expected_response
