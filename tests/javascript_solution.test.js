const solution = require('../solution_javascript');
const test_input = require('./test_input.json');
const expected_output = require('./expected_output.json');

test('test if the solution works', () => {
  expect(solution(test_input)).toEqual(expected_output);
});
