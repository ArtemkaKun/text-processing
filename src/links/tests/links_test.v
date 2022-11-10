import src.links

fn test_extract_links() {
	input := ['LINK HERE -> https://test.com <- LINK HERE', 'https://test.com',
		'https://test.com <- there']
	expected := ['https://test.com', 'https://test.com', 'https://test.com']

	for value_index, value in input {
		assert expected[value_index] == links.extract_link(value)!
	}
}
