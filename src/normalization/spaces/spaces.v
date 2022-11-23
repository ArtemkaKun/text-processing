module spaces

struct Range {
	start      int
	end        int
	is_on_edge bool
}

pub fn normalize_inner_spaces(original_string string) string {
	return construct_normalized_string(original_string, determine_spaces_ranges(original_string))
}

fn determine_spaces_ranges(original_string string) []Range {
	mut space_ranges := []Range{}
	mut is_counting_spaces_range := false

	for character_index, character in original_string {
		if character == ` ` {
			if is_counting_spaces_range == false {
				space_ranges << Range{
					start: character_index
				}

				is_counting_spaces_range = true
			}

			space_ranges = process_spaces_ranges(space_ranges, character_index, original_string.len - 1)
		} else {
			is_counting_spaces_range = false
		}
	}

	return space_ranges
}

fn process_spaces_ranges(space_ranges []Range, current_space_index int, edge_end_position int) []Range {
	mut processed_spaces_ranges := space_ranges.clone()

	actual_last_spaces_range := space_ranges[space_ranges.len - 1]
	processed_spaces_ranges[processed_spaces_ranges.len - 1] = process_spaces_range(actual_last_spaces_range,
		current_space_index, edge_end_position)

	return processed_spaces_ranges
}

fn process_spaces_range(actual_last_spaces_range Range, current_space_index int, edge_end_position int) Range {
	return Range{
		start: actual_last_spaces_range.start
		end: current_space_index
		is_on_edge: check_if_range_is_on_edge(actual_last_spaces_range.start, current_space_index,
			edge_end_position)
	}
}

fn check_if_range_is_on_edge(range_start int, range_end int, end_position int) bool {
	return range_start == 0 || range_end == end_position
}

fn construct_normalized_string(original_string string, space_ranges []Range) string {
	spaceless_original_string_as_array := original_string.replace(' ', '').bytes()

	return insert_spaces(spaceless_original_string_as_array, space_ranges).bytestr()
}

fn insert_spaces(string_to_insert []u8, space_ranges []Range) []u8 {
	string_with_edge_spaces_as_array := insert_edge_spaces(string_to_insert, space_ranges)

	return insert_normalized_inner_spaces(string_with_edge_spaces_as_array, space_ranges)
}

fn insert_edge_spaces(spaceless_original_string_as_array []u8, space_ranges []Range) []u8 {
	mut normalized_string_with_edge_spaces_as_array := spaceless_original_string_as_array.clone()

	for spaces_range in space_ranges {
		normalized_string_with_edge_spaces_as_array = try_insert_edge_spaces(normalized_string_with_edge_spaces_as_array,
			spaces_range)
	}

	return normalized_string_with_edge_spaces_as_array
}

fn try_insert_edge_spaces(string_to_insert []u8, spaces_range Range) []u8 {
	if spaces_range.is_on_edge {
		return insert_spaces_at_position(string_to_insert, spaces_range.start,
			(spaces_range.end - spaces_range.start) + 1)
	}

	return string_to_insert
}

fn insert_normalized_inner_spaces(normalized_string_with_edge_spaces_as_array []u8, space_ranges []Range) []u8 {
	mut normalized_string_as_array := normalized_string_with_edge_spaces_as_array.clone()

	for spaces_range in space_ranges {
		normalized_string_as_array = try_insert_normalized_inner_spaces(normalized_string_as_array,
			spaces_range)
	}

	return normalized_string_as_array
}

fn try_insert_normalized_inner_spaces(string_to_insert []u8, spaces_range Range) []u8 {
	if spaces_range.is_on_edge == false {
		return insert_spaces_at_position(string_to_insert, spaces_range.start, 1)
	}

	return string_to_insert
}

fn insert_spaces_at_position(string_to_insert []u8, position_index int, spaces_count int) []u8 {
	mut value_with_spaces := string_to_insert.clone()

	if position_index < value_with_spaces.len {
		value_with_spaces.insert(position_index, []u8{len: spaces_count, init: ` `})
	} else {
		value_with_spaces << []u8{len: spaces_count, init: ` `}
	}

	return value_with_spaces
}
