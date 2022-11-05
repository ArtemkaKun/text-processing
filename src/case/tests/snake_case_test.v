import src.text_processing.case

fn test_strings_to_snake_case() {
	input := ['foo']
	expected := ['foo']

	for value_index, value in input {
		assert expected[value_index] == case.string_to_snake_case(value)
	}
}
