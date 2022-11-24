// This code was made to resolve the inner spaces duplication (like "hello  world").
// So you might use this code to validate or clean text data. Also it can be used in data science, where you often need to have normalized data.
//
// The logic of the code:
// 	1. We iterate over the input string and determine space ranges with indexes (the first is 0) as positions (for example, "hello  world" will be [5, 6]).
// 	2. We normalize ONLY space ranges that are inside the string, so we will skip all ranges that starts with 0 or ended with the last index of the string
// 	3. We removes all spaces from the string and then insert original (on edges) and normalized space ranges to the string.

module spaces

// Example:
// 	'hello world' -> 'hello world'
// 	'hello  world' -> 'hello world'
// 	'   hello  world   ' -> '   hello world   '
pub fn normalize_inner_spaces(original_string string) string {
	space_ranges := determine_space_ranges(original_string)
	normalized_space_ranges := normalize_space_ranges(space_ranges, original_string.len - 1)

	return construct_normalized_string(original_string, normalized_space_ranges)
}

// Example:
// 	'hello world' -> [Range{start: 5, end: 5}]
// 	'hello  world' -> [Range{start: 5, end: 6}]
// 	'   hello  world   ' -> [Range{start: 0, end: 2}, Range{start: 8, end: 9}, Range{start: 15, end: 17}]
fn determine_space_ranges(original_string string) []Range {
	mut space_ranges := []Range{}
	mut is_counting_range := false // We need to keep track of the current state to determine the start and the end of the range.

	for character_index, character in original_string {
		// When try_process_space() returns false, it means that the current character is not a space, so we need to stop counting the range.
		is_counting_range = try_process_space(character_index, character, is_counting_range, mut
			space_ranges)
	}

	return space_ranges
}

// I really didn't want to use mutability here, but I decided that 3-deep nesting is a bigger evil than mutability of one parameter.
fn try_process_space(character_index int, character rune, is_counting_range bool, mut space_ranges []Range) bool {
	if character == ` ` {
		start_new_space_range_if_needed(character_index, is_counting_range, mut space_ranges) // We updating the last one member of the space_ranges array, so we ned to make sure that it exists and that this is the right one.
		space_ranges = update_last_space_range(space_ranges, character_index)

		return true
	}

	return false
}

// This method is exists only to get rid of 3-deep nesting.
fn start_new_space_range_if_needed(character_index int, is_counting_range bool, mut space_ranges []Range) {
	if is_counting_range == false { // This is true only in 2 cases: for the first space in a string OR the previous character was not a space, so we closed the previous range and need to start a new one.
		space_ranges << Range{
			start: character_index
		}
	}
}

fn update_last_space_range(space_ranges []Range, new_end_position int) []Range {
	mut updated_ranges := space_ranges.clone()
	actual_last_range := space_ranges.last()

	updated_ranges[updated_ranges.len - 1] = update_range(actual_last_range, new_end_position)

	return updated_ranges
}

// Example:
// 	[Range{start: 0, end: 2}, Range{start: 8, end: 9}, Range{start: 15, end: 17}], 17 -> [Range{start: 0, end: 2}, Range{start: 8, end: 8}, Range{start: 15, end: 17}]
fn normalize_space_ranges(space_ranges []Range, original_string_last_index int) []Range {
	mut normalized_space_ranges := []Range{}
	mut left_shift := 0 // Since we shrink space ranges, we need to keep track of the left shift to calculate the right position of all next ranges.

	for space_range in space_ranges {
		normalized_range, additional_shift := try_normalize_space_range(space_range, original_string_last_index,
			left_shift)
		normalized_space_ranges << normalized_range
		left_shift += additional_shift // We need to take into account all previous shifts, not only the last one.
	}

	return normalized_space_ranges
}

fn try_normalize_space_range(space_range Range, original_string_last_index int, left_shift int) (Range, int) {
	if check_if_range_is_on_edge(space_range, original_string_last_index) { // We don't change spaces on the edge of the string, only inner ones. So just shift the range to the left.
		return Range{
			start: space_range.start - left_shift
			end: space_range.end - left_shift
		}, 0
	}

	new_left_shift := space_range.end - space_range.start // Calculating the new left shift because this range will be normalized to a single space.

	// We set the end of the range to be equal to the start of the range, because later in calculations this will mean that the range has a length of 1.
	// This is the way we are normalizing spaces.
	return Range{
		start: space_range.start - left_shift
		end: space_range.start - left_shift
	}, new_left_shift
}

fn construct_normalized_string(original_string string, space_ranges []Range) string {
	spaceless_original_string_as_array := original_string.replace(' ', '').bytes() // Inserting to array of bytes is more clean and easy than inserting to string (especially when you need to insert at specific position).

	return insert_spaces(spaceless_original_string_as_array, space_ranges).bytestr()
}

// Example:
// 	'helloworld', [Range{start: 5, end: 5}] -> 'hello world'
fn insert_spaces(string_to_insert []u8, space_ranges []Range) []u8 {
	mut normalized_string_as_array := string_to_insert.clone()

	for spaces_range in space_ranges {
		spaces_count := (spaces_range.end - spaces_range.start) + 1 // Because we count ranges from 0, we need to add 1 to get the actual count of spaces.
		normalized_string_as_array = insert_spaces_at_position(normalized_string_as_array,
			spaces_range.start, spaces_count)
	}

	return normalized_string_as_array
}

fn insert_spaces_at_position(string_to_insert []u8, position int, spaces_count int) []u8 {
	mut string_with_spaces := string_to_insert.clone()
	spaces_to_add := []u8{len: spaces_count, init: ` `}

	if position >= string_with_spaces.len { // The problem is that space ranges are calculated for the original string, but we working on the original string without spaces, so we need to check if we need to insert or append.
		string_with_spaces << spaces_to_add
	} else {
		string_with_spaces.insert(position, spaces_to_add)
	}

	return string_with_spaces
}
