module punctuation

import regex

const punctuation_regex_filter = r'[^\w\s]'

pub fn clean_punctuation(string_to_clean string) !string {
	mut punctuation_regex := regex.regex_opt(punctuation.punctuation_regex_filter) or { return err }

	return punctuation_regex.replace(string_to_clean, '')
}
