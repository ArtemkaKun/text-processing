import src.normalization.spaces

fn test_normalize_inner_spaces() {
	input := [
		'test',
		'hello world',
		'hello  world',
		'   hello world   ',
		'hello   world',
		'hello world   ',
		'   hello   world   ',
		'hello                           my                                       world',
		'    hello                           my                                       world    ',
		'hello          my              test world',
		"I'm literally just a normal string",
		'    too many                                                                     spaces   HELP        ME   PLEASE                        A   ',
	]

	expected := [
		'test',
		'hello world',
		'hello world',
		'   hello world   ',
		'hello world',
		'hello world   ',
		'   hello world   ',
		'hello my world',
		'    hello my world    ',
		'hello my test world',
		"I'm literally just a normal string",
		'    too many spaces HELP ME PLEASE A   ',
	]

	for value_index, result in input {
		assert expected[value_index] == spaces.normalize_inner_spaces(result)
	}
}
