module punctuation

import src.common

const punctuation_regex_filter = r'[^\w\s]'

pub fn clean_punctuation(string_to_clean string) string {
	mut punctuation_regex := common.create_regex(punctuation.punctuation_regex_filter)

	return punctuation_regex.replace(string_to_clean, '')
}
