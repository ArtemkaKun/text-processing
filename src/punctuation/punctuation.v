module punctuation

import src.common

// This regex filter was copied from https://stackoverflow.com/a/16799238
const punctuation_regex_filter = r'[^\w\s]'

// ATTENTION: this method can potentially destroy the original meaning/grammar of the input string, since it remove ALL punctuation characaters
//
// Example:
//   "Hello, world!" -> "Hello world"
pub fn clean_punctuation(string_to_clean string) string {
	mut punctuation_regex := common.create_regex(punctuation.punctuation_regex_filter)

	return punctuation_regex.replace(string_to_clean, '')
}
