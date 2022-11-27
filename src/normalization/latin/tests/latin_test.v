import src.normalization.latin

fn test_normalize_latin() {
  assert normalize_latin('') == ''
  assert normalize_latin('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz') == '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
  assert normalize_latin('AĀBCČDEĒFGĢHIĪJKĶLĻMNŅOPQRSŠTUŪVXYWZŽ') == 'AABCCDEEFGGHIIJKKLLMNNOPQRSSTUUVXYWZZ'
  assert normalize_latin('aābcčdeēfgģhiījkķlļmnņopqrsštuūvxywzž') == 'aabccdeefgghiijkkllmnnopqrsstuuvxywzz'
  assert normalize_latin('ąĄčČęĘėĖįĮšŠųŲūŪžŽ') == 'aAcCeEeEiIsSuUuUzZ'
  assert normalize_latin('ãẽĩõũñỹ') == 'aeiouny'
  assert normalize_latin('ÃẼĨÕŨÑỸ') == 'AEIOUNY'
  assert normalize_latin('àèìòùǹỳẁ') == 'aeiounyw'
  assert normalize_latin('ÀÈÌÒÙǸỲẀ') == 'AEIOUNYW'
  assert normalize_latin('áéíóúǵḱĺḿńṕŕśẃýź') == 'aeiougklmnprswyz' 
  assert normalize_latin('ÁÉÍÓÚǴḰĹḾŃṔŔŚẂÝŹ') == 'AEIOUGKLMNPRSWYZ'
  assert normalize_latin('âêîôûĉĝĥĵŝŷŵẑ') == 'aeioucghjsywz'
  assert normalize_latin('ÂÊÎÔÛĈĜĤĴŜŶŴẐ') == 'AEIOUCGHJSYWZ'
  assert normalize_latin('äëïöüḧẗẍÿẅ') == 'aeiouhtxyw'
  assert normalize_latin('ÄËÏÖÜḦẌŸẄ') == 'AEIOUHXYW'
  assert normalize_latin('åÅ') == 'aA'
  assert normalize_latin('æÆ') == 'aeAE'
  assert normalize_latin('çÇ') == 'cC'
  assert normalize_latin('øØ') == 'oO'
  assert normalize_latin('ß') == 's'
  assert normalize_latin('В начале') == 'В начале'
  assert normalize_latin('最初有道') == '最初有道'
  assert normalize_latin('לפניכם') == 'לפניכם'
  //assert normalize_latin('œŒ') == 'oeOE' // not working. should ???
}
