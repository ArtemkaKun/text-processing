import src.punctuation

fn test_clean_punctuation() {
	// vfmt off
	input_to_expected_map := {
		'Hello. world':    'Hello world'
		'Hello, world':    'Hello world'
		'Hello world?':    'Hello world'
		'Hello world!':    'Hello world'
		'Hello world;':    'Hello world'
		'Hello : world':   'Hello  world'
		'Hello - world':   'Hello  world' // Hyphen
		'Hello – world':   'Hello  world' // Dash
		'[Hello world]':   'Hello world'
		'(Hello world)':   'Hello world'
		'{Hello world}':   'Hello world'
		'Hello world…':    'Hello world' // Ellipsis
		"Hello w'orld":    'Hello world'
		'Hello "world"':   'Hello world'
		'Hello. World?':   'Hello World'
		'(Hello) world!':  'Hello world'
		'Hello world':     'Hello world'
	}
	// vfmt on

	for input, expected in input_to_expected_map {
		assert punctuation.clean_punctuation(input) == expected
	}
}
