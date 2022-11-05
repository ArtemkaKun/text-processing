module case

// Converts a string in any case to a string in snake_case.
// Example:
// 'foo' -> 'foo'
// 'fooBar' -> 'foo_bar'
// 'AccessSpecDecl' -> 'access_spec_decl'
// 'CStyleCastExpr' -> 'c_style_cast_expr'
// 'CXX' -> 'cxx'
// 'ObjCClassRef' -> 'obj_c_class_ref'
// 'VAArgExpr' -> 'va_arg_expr'
pub fn string_to_snake_case(value string) string {
	mut snake_cased_string := ''

	for character_index, character in value {
		if character.is_capital() && (index_on_array_edges(character_index, value.len)
			|| character_surrounded_by_capital_characters(character_index, value)) == false {
			snake_cased_string += '_'
		}

		snake_cased_string += character.ascii_str().to_lower()
	}

	return snake_cased_string
}

fn index_on_array_edges(index int, array_length int) bool {
	return index == 0 || index == array_length - 1
}

fn character_surrounded_by_capital_characters(character_index int, original_string string) bool {
	return original_string[character_index + 1].is_capital()
		&& original_string[character_index - 1].is_capital()
}
