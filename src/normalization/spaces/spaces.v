module spaces

struct Range {
mut:
	start int
	end   int
}

pub fn normalize_inner_spaces(original_string string) string {
	mut space_ranges := []Range{}

	mut is_counting_space_range := false
	mut range_buffer := Range{}

	for character_index, character in original_string {
		if character == ` ` {
			if is_counting_space_range == false {
				range_buffer.start = character_index
			}

			is_counting_space_range = true
			range_buffer.end = character_index
		} else {
			if is_counting_space_range {
				is_counting_space_range = false
				space_ranges << range_buffer
				range_buffer.start = 0
				range_buffer.end = 0
			}
		}
	}

	if range_buffer.start != 0 && range_buffer.end != 0 {
		space_ranges << range_buffer
	}

	mut normalized_string := original_string
	normalized_string = normalized_string.replace(' ', '')
	mut normalized_string_as_array := normalized_string.bytes()

	for spaces_range in space_ranges {
		if spaces_range.start > 0 && spaces_range.end != original_string.len - 1 {
			normalized_string_as_array.insert(spaces_range.start, ` `)
		} else {
			if spaces_range.start < normalized_string_as_array.len {
				normalized_string_as_array.insert(spaces_range.start, []u8{len:
					(spaces_range.end - spaces_range.start) + 1, init: ` `})
			} else {
				normalized_string_as_array << []u8{len: (spaces_range.end - spaces_range.start) + 1, init: ` `}
			}
		}
	}

	return normalized_string_as_array.bytestr()
}
