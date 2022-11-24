module spaces

// A struct is used instead of an double element array to add more context to the code (clear and readable access to start and end of the range).
struct Range {
	start int
	end   int
}

fn update_range(actual_range Range, new_end_position int) Range {
	return Range{
		start: actual_range.start
		end: new_end_position
	}
}

fn check_if_range_is_on_edge(range Range, edge_end_position int) bool {
	return range.start == 0 || range.end == edge_end_position
}
