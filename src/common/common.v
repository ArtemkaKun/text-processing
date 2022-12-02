module common

import regex

pub fn create_regex(filter string) regex.RE {
	return regex.regex_opt(filter) or { panic(err) }
}
