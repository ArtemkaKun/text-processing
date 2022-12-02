import src.normalization.latin

fn test_normalize_latin_diacritics() {
	input_to_expected_map := {
		// vfmt off
		'':																  ''
		'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz': '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
		'AĀBCČDEĒFGĢHIĪJKĶLĻMNŅOPQRSŠTUŪVXYWZŽ':						  'AABCCDEEFGGHIIJKKLLMNNOPQRSSTUUVXYWZZ'
		'aābcčdeēfgģhiījkķlļmnņopqrsštuūvxywzž':						  'aabccdeefgghiijkkllmnnopqrsstuuvxywzz'
		'ąĄčČęĘėĖįĮšŠųŲūŪžŽ':                           				  'aAcCeEeEiIsSuUuUzZ'
		'ãẽĩõũñỹ':                                               		  'aeiouny'
		'ÃẼĨÕŨÑỸ':                                               		  'AEIOUNY'
		'àèìòùǹỳẁ':                                             		  'aeiounyw'
		'ÀÈÌÒÙǸỲẀ':                                             		  'AEIOUNYW'
		'áéíóúǵḱĺḿńṕŕśẃýź':                           					  'aeiougklmnprswyz'
		'ÁÉÍÓÚǴḰĹḾŃṔŔŚẂÝŹ':                           					  'AEIOUGKLMNPRSWYZ'
		'âêîôûĉĝĥĵŝŷŵẑ':                                    			  'aeioucghjsywz'
		'ÂÊÎÔÛĈĜĤĴŜŶŴẐ':                                    			  'AEIOUCGHJSYWZ'
		'äëïöüḧẗẍÿẅ':                                       			  'aeiouhtxyw'
		'ÄËÏÖÜḦẌŸẄ':                                          			  'AEIOUHXYW'
		'åÅ':                                                             'aA'
		'æÆ':                                                             'aeAE'
		'çÇ':                                                             'cC'
		'øØ':                                                             'oO'
		'ß':                                                              's'
		'В начале':                                                       'В начале'
		'最初有道':														  '最初有道'
		'לפניכם':														  'לפניכם'
		// TODO: 'œŒ' : 'oeOE'
		// vfmt on
	}

	for input, expected in input_to_expected_map {
		assert latin.normalize_latin_diacritics(input) == expected
	}
}
