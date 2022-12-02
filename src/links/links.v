module links

import src.common

const links_regex_query = r'https' // ATTENTION: this is not valid regex, since we only using regex.find(), not regex.match(). A valid regex need to be reimplemented.

// ATTENTION: this function will find only https links. Neither http nor other protocols will be found. This is because of HACK (next line).
//
// HACK: this function doesn't use regex.match() because of strange bug related to no matches in valid text with valid rule.
//       so regex.find() was used instead to find start of the link. End of the link is found by searching for the next ' ' or '\n' or '\r' or '\t' character.
//
// ATTENTION: This is not the best way to do it and it's produce invalid results sometimes (like instead of 'http://link.com/' it will return 'http://link.com>').
//
// TODO: reimplement this function using regex.match() (fix a bug in regex.match() first).
//
// Example
//
// Input:
//   'LINK HERE -> https://link.com <- LINK HERE'
//
// Output:
//   'https://link.com'
pub fn extract_link(value string) !string {
	mut links_regex := common.create_regex(links.links_regex_query)
	start, _ := links_regex.find(value)

	if start != -1 {
		mut link_end := start

		for character in value[start..] {
			if character in [` `, `\n`, `\t`, `\r`] { // this is needed to handle different message formatting
				break
			}

			link_end += 1
		}

		return value[start..link_end]
	}

	return error("Value doesn't contain any link")
}
