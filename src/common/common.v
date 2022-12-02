module common

import regex

// Just a wrapper around regex RE creatin to make it easier to use and have the same code in one place (in case in need to be replaced for example)
// If cannot create the regex, it will panic
pub fn create_regex(filter string) regex.RE {
	return regex.regex_opt(filter) or { panic(err) }
}
