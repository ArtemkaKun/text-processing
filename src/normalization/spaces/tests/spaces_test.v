import src.normalization.spaces

fn test_normalize_inner_spaces() {
	input := ['test', 'hello world', 'hello  world', '   hello world   ', 'hello   world',
		'hello world   ', '   hello   world   ']
	expected := ['test', 'hello world', 'hello world', '   hello world   ', 'hello world',
		'hello world   ', '   hello world   ']

	for value_index, result in input {
		assert expected[value_index] == spaces.normalize_inner_spaces(result)
	}
}
