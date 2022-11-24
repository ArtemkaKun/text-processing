module spaces

struct Range {
	start int
	end   int
}

pub fn normalize_inner_spaces(original_string string) string {
	space_ranges := determine_space_ranges(original_string)
	normalized_space_ranges := normalize_space_ranges(original_string.len - 1, space_ranges)

	return construct_normalized_string(original_string, normalized_space_ranges)
}

fn determine_space_ranges(original_string string) []Range {
	mut space_ranges := []Range{}
	mut is_counting_range := false

	for character_index, character in original_string {
		if character == ` ` {
			if is_counting_range == false {
				space_ranges << Range{
					start: character_index
				}

				is_counting_range = true
			}

			space_ranges = update_last_space_range(space_ranges, character_index)
		} else {
			is_counting_range = false
		}
	}

	return space_ranges
}

fn update_last_space_range(space_ranges []Range, new_end_position int) []Range {
	mut updated_ranges := space_ranges.clone()
	actual_last_range := space_ranges.last()

	updated_ranges[updated_ranges.len - 1] = update_range(actual_last_range, new_end_position)

	return updated_ranges
}

fn update_range(actual_range Range, new_end_position int) Range {
	return Range{
		start: actual_range.start
		end: new_end_position
	}
}

fn normalize_space_ranges(original_string_last_index int, space_ranges []Range) []Range {
	mut normalized_space_ranges := []Range{}

	for space_range in space_ranges {
		if check_if_range_is_on_edge(space_range, original_string_last_index) {
			normalized_space_ranges << space_range
		} else {
			normalized_space_ranges << Range{
				start: space_range.start
				end: space_range.start
			}
		}
	}

	return normalized_space_ranges
}

fn check_if_range_is_on_edge(range Range, edge_end_position int) bool {
	return range.start == 0 || range.end == edge_end_position
}

fn construct_normalized_string(original_string string, space_ranges []Range) string {
	spaceless_original_string_as_array := original_string.replace(' ', '').bytes()

	return insert_spaces(spaceless_original_string_as_array, space_ranges).bytestr()
}

fn insert_spaces(string_to_insert []u8, space_ranges []Range) []u8 {
	mut normalized_string_as_array := string_to_insert.clone()

	for spaces_range in space_ranges {
		spaces_count := (spaces_range.end - spaces_range.start) + 1
		normalized_string_as_array = insert_spaces_at_position(normalized_string_as_array,
			spaces_range.start, spaces_count)
	}

	return normalized_string_as_array
}

fn insert_spaces_at_position(string_to_insert []u8, position int, spaces_count int) []u8 {
	mut string_with_spaces := string_to_insert.clone()
	spaces_to_add := []u8{len: spaces_count, init: ` `}

	if position < string_with_spaces.len {
		string_with_spaces.insert(position, spaces_to_add)
	} else {
		string_with_spaces << spaces_to_add
	}

	return string_with_spaces
}
