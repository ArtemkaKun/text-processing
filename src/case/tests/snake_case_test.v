import src.case

fn test_strings_to_snake_case() {
	input := ['foo', 'fooBar', 'AccessSpecDecl', 'CStyleCastExpr', 'CXX', 'ObjCClassRef', 'VAArgExpr']
	expected := ['foo', 'foo_bar', 'access_spec_decl', 'c_style_cast_expr', 'cxx', 'obj_c_class_ref',
		'va_arg_expr']

	for value_index, value in input {
		assert expected[value_index] == case.string_to_snake_case(value)
	}
}
