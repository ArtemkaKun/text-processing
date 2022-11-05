import src.text_processing.links

fn test_extract_links() {
	input := ['LINK HERE -> https://test.com <- LINK HERE']
	expected := ['https://test.com']

	for value_index, value in input {
		assert expected[value_index] == links.extract_link(value)!
	}
}
