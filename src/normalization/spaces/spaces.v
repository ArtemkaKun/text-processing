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

	actual_last_spaces_range := space_ranges.last()
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
	mut normalized_string_as_array := string_to_insert.clone()

	for spaces_range in space_ranges {
		mut additional_spaces := 0

		if spaces_range.is_on_edge {
			additional_spaces = spaces_range.end - spaces_range.start
		}

		normalized_string_as_array = insert_spaces_at_position(normalized_string_as_array,
			spaces_range.start, additional_spaces + 1)
	}

	return normalized_string_as_array
}

fn insert_spaces_at_position(string_to_insert []u8, position_index int, spaces_count int) []u8 {
	mut value_with_spaces := string_to_insert.clone()
	spaces_to_add := []u8{len: spaces_count, init: ` `}

	if position_index < value_with_spaces.len {
		value_with_spaces.insert(position_index, spaces_to_add)
	} else {
		value_with_spaces << spaces_to_add
	}

	return value_with_spaces
}
