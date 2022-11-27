module latin

// maps accented letters to normal latin letters without diacrilics
// adapted from: http://web.archive.org/web/20120918093154/http://lehelk.com/2011/05/06/script-to-remove-diacritics/
const convertibles = {
  // accented letters that maps into 'A'
  u32(0x0041): 'A', 0x24B6: 'A', 0xFF21: 'A', 0x00C0: 'A',
  0x00C1: 'A', 0x00C2: 'A', 0x1EA6: 'A', 0x1EA4: 'A',
  0x1EAA: 'A', 0x1EA8: 'A', 0x00C3: 'A', 0x0100: 'A',
  0x0102: 'A', 0x1EB0: 'A', 0x1EAE: 'A', 0x1EB4: 'A',
  0x1EB2: 'A', 0x0226: 'A', 0x01E0: 'A', 0x00C4: 'A',
  0x01DE: 'A', 0x1EA2: 'A', 0x00C5: 'A', 0x01FA: 'A',
  0x01CD: 'A', 0x0200: 'A', 0x0202: 'A', 0x1EA0: 'A',
  0x1EAC: 'A', 0x1EB6: 'A', 0x1E00: 'A', 0x0104: 'A',
  0x023A: 'A', 0x2C6F: 'A',

  // accented letters that maps into 'AA'
  0xA732: 'AA',

  // accented letters that maps into 'AE'
  0x00C6: 'AE', 0x01FC: 'AE', 0x01E2: 'AE',

  // accented letters that maps into 'AO'
  0xA734: 'AO',

  // accented letters that maps into 'AU'
  0xA736: 'AU',

  // accented letters that maps into 'AV'
  0xA738: 'AV', 0xA73A: 'AV',

  // accented letters that maps into 'AY'
  0xA73C: 'AY',

  // accented letters that maps into 'B'
  0x0042: 'B', 0x24B7: 'B', 0xFF22: 'B', 0x1E02: 'B',
  0x1E04: 'B', 0x1E06: 'B', 0x0243: 'B', 0x0182: 'B',
  0x0181: 'B',

  // accented letters that maps into 'C'
  0x0043: 'C', 0x24B8: 'C', 0xFF23: 'C', 0x0106: 'C',
  0x0108: 'C', 0x010A: 'C', 0x010C: 'C', 0x00C7: 'C',
  0x1E08: 'C', 0x0187: 'C', 0x023B: 'C', 0xA73E: 'C',

  // accented letters that maps into 'D'
  0x0044: 'D', 0x24B9: 'D', 0xFF24: 'D', 0x1E0A: 'D',
  0x010E: 'D', 0x1E0C: 'D', 0x1E10: 'D', 0x1E12: 'D',
  0x1E0E: 'D', 0x0110: 'D', 0x018B: 'D', 0x018A: 'D',
  0x0189: 'D', 0xA779: 'D',

  // accented letters that maps into 'DZ'
  0x01F1: 'DZ', 0x01C4: 'DZ',

  // accented letters that maps into 'Dz'
  0x01F2: 'Dz', 0x01C5: 'Dz',

  // accented letters that maps into 'E'
  0x0045: 'E', 0x24BA: 'E', 0xFF25: 'E', 0x00C8: 'E',
  0x00C9: 'E', 0x00CA: 'E', 0x1EC0: 'E', 0x1EBE: 'E',
  0x1EC4: 'E', 0x1EC2: 'E', 0x1EBC: 'E', 0x0112: 'E',
  0x1E14: 'E', 0x1E16: 'E', 0x0114: 'E', 0x0116: 'E',
  0x00CB: 'E', 0x1EBA: 'E', 0x011A: 'E', 0x0204: 'E',
  0x0206: 'E', 0x1EB8: 'E', 0x1EC6: 'E', 0x0228: 'E',
  0x1E1C: 'E', 0x0118: 'E', 0x1E18: 'E', 0x1E1A: 'E',
  0x0190: 'E', 0x018E: 'E',

  // accented letters that maps into 'F'
  0x0046: 'F', 0x24BB: 'F', 0xFF26: 'F', 0x1E1E: 'F',
  0x0191: 'F', 0xA77B: 'F',

  // accented letters that maps into 'G'
  0x0047: 'G', 0x24BC: 'G', 0xFF27: 'G', 0x01F4: 'G',
  0x011C: 'G', 0x1E20: 'G', 0x011E: 'G', 0x0120: 'G',
  0x01E6: 'G', 0x0122: 'G', 0x01E4: 'G', 0x0193: 'G',
  0xA7A0: 'G', 0xA77D: 'G', 0xA77E: 'G',

  // accented letters that maps into 'H'
  0x0048: 'H', 0x24BD: 'H', 0xFF28: 'H', 0x0124: 'H',
  0x1E22: 'H', 0x1E26: 'H', 0x021E: 'H', 0x1E24: 'H',
  0x1E28: 'H', 0x1E2A: 'H', 0x0126: 'H', 0x2C67: 'H',
  0x2C75: 'H', 0xA78D: 'H',

  // accented letters that maps into 'I'
  0x0049: 'I', 0x24BE: 'I', 0xFF29: 'I', 0x00CC: 'I',
  0x00CD: 'I', 0x00CE: 'I', 0x0128: 'I', 0x012A: 'I',
  0x012C: 'I', 0x0130: 'I', 0x00CF: 'I', 0x1E2E: 'I',
  0x1EC8: 'I', 0x01CF: 'I', 0x0208: 'I', 0x020A: 'I',
  0x1ECA: 'I', 0x012E: 'I', 0x1E2C: 'I', 0x0197: 'I',

  // accented letters that maps into 'J'
  0x004A: 'J', 0x24BF: 'J', 0xFF2A: 'J', 0x0134: 'J',
  0x0248: 'J',

  // accented letters that maps into 'K'
  0x004B: 'K', 0x24C0: 'K', 0xFF2B: 'K', 0x1E30: 'K',
  0x01E8: 'K', 0x1E32: 'K', 0x0136: 'K', 0x1E34: 'K',
  0x0198: 'K', 0x2C69: 'K', 0xA740: 'K', 0xA742: 'K',
  0xA744: 'K', 0xA7A2: 'K',

  // accented letters that maps into 'L'
  0x004C: 'L', 0x24C1: 'L', 0xFF2C: 'L', 0x013F: 'L',
  0x0139: 'L', 0x013D: 'L', 0x1E36: 'L', 0x1E38: 'L',
  0x013B: 'L', 0x1E3C: 'L', 0x1E3A: 'L', 0x0141: 'L',
  0x023D: 'L', 0x2C62: 'L', 0x2C60: 'L', 0xA748: 'L',
  0xA746: 'L', 0xA780: 'L',

  // accented letters that maps into 'LJ'
  0x01C7: 'LJ',

  // accented letters that maps into 'Lj'
  0x01C8: 'Lj',

  // accented letters that maps into 'M'
  0x004D: 'M', 0x24C2: 'M', 0xFF2D: 'M', 0x1E3E: 'M',
  0x1E40: 'M', 0x1E42: 'M', 0x2C6E: 'M', 0x019C: 'M',

  // accented letters that maps into 'N'
  0x004E: 'N', 0x24C3: 'N', 0xFF2E: 'N', 0x01F8: 'N',
  0x0143: 'N', 0x00D1: 'N', 0x1E44: 'N', 0x0147: 'N',
  0x1E46: 'N', 0x0145: 'N', 0x1E4A: 'N', 0x1E48: 'N',
  0x0220: 'N', 0x019D: 'N', 0xA790: 'N', 0xA7A4: 'N',

  // accented letters that maps into 'NJ'
  0x01CA: 'NJ',

  // accented letters that maps into 'Nj'
  0x01CB: 'Nj',

  // accented letters that maps into 'O'
  0x004F: 'O', 0x24C4: 'O', 0xFF2F: 'O', 0x00D2: 'O',
  0x00D3: 'O', 0x00D4: 'O', 0x1ED2: 'O', 0x1ED0: 'O',
  0x1ED6: 'O', 0x1ED4: 'O', 0x00D5: 'O', 0x1E4C: 'O',
  0x022C: 'O', 0x1E4E: 'O', 0x014C: 'O', 0x1E50: 'O',
  0x1E52: 'O', 0x014E: 'O', 0x022E: 'O', 0x0230: 'O',
  0x00D6: 'O', 0x022A: 'O', 0x1ECE: 'O', 0x0150: 'O',
  0x01D1: 'O', 0x020C: 'O', 0x020E: 'O', 0x01A0: 'O',
  0x1EDC: 'O', 0x1EDA: 'O', 0x1EE0: 'O', 0x1EDE: 'O',
  0x1EE2: 'O', 0x1ECC: 'O', 0x1ED8: 'O', 0x01EA: 'O',
  0x01EC: 'O', 0x00D8: 'O', 0x01FE: 'O', 0x0186: 'O',
  0x019F: 'O', 0xA74A: 'O', 0xA74C: 'O',

  // accented letters that maps into 'OI'
  0x01A2: 'OI',

  // accented letters that maps into 'OO'
  0xA74E: 'OO',

  // accented letters that maps into 'OU'
  0x0222: 'OU',

  // accented letters that maps into 'P'
  0x0050: 'P', 0x24C5: 'P', 0xFF30: 'P', 0x1E54: 'P',
  0x1E56: 'P', 0x01A4: 'P', 0x2C63: 'P', 0xA750: 'P',
  0xA752: 'P', 0xA754: 'P',

  // accented letters that maps into 'Q'
  0x0051: 'Q', 0x24C6: 'Q', 0xFF31: 'Q', 0xA756: 'Q',
  0xA758: 'Q', 0x024A: 'Q',

  // accented letters that maps into 'R'
  0x0052: 'R', 0x24C7: 'R', 0xFF32: 'R', 0x0154: 'R',
  0x1E58: 'R', 0x0158: 'R', 0x0210: 'R', 0x0212: 'R',
  0x1E5A: 'R', 0x1E5C: 'R', 0x0156: 'R', 0x1E5E: 'R',
  0x024C: 'R', 0x2C64: 'R', 0xA75A: 'R', 0xA7A6: 'R',
  0xA782: 'R',

  // accented letters that maps into 'S'
  0x0053: 'S', 0x24C8: 'S', 0xFF33: 'S', 0x1E9E: 'S',
  0x015A: 'S', 0x1E64: 'S', 0x015C: 'S', 0x1E60: 'S',
  0x0160: 'S', 0x1E66: 'S', 0x1E62: 'S', 0x1E68: 'S',
  0x0218: 'S', 0x015E: 'S', 0x2C7E: 'S', 0xA7A8: 'S',
  0xA784: 'S',

  // accented letters that maps into 'T'
  0x0054: 'T', 0x24C9: 'T', 0xFF34: 'T', 0x1E6A: 'T',
  0x0164: 'T', 0x1E6C: 'T', 0x021A: 'T', 0x0162: 'T',
  0x1E70: 'T', 0x1E6E: 'T', 0x0166: 'T', 0x01AC: 'T',
  0x01AE: 'T', 0x023E: 'T', 0xA786: 'T',

  // accented letters that maps into 'TZ'
  0xA728: 'TZ',

  // accented letters that maps into 'U'
  0x0055: 'U', 0x24CA: 'U', 0xFF35: 'U', 0x00D9: 'U',
  0x00DA: 'U', 0x00DB: 'U', 0x0168: 'U', 0x1E78: 'U',
  0x016A: 'U', 0x1E7A: 'U', 0x016C: 'U', 0x00DC: 'U',
  0x01DB: 'U', 0x01D7: 'U', 0x01D5: 'U', 0x01D9: 'U',
  0x1EE6: 'U', 0x016E: 'U', 0x0170: 'U', 0x01D3: 'U',
  0x0214: 'U', 0x0216: 'U', 0x01AF: 'U', 0x1EEA: 'U',
  0x1EE8: 'U', 0x1EEE: 'U', 0x1EEC: 'U', 0x1EF0: 'U',
  0x1EE4: 'U', 0x1E72: 'U', 0x0172: 'U', 0x1E76: 'U',
  0x1E74: 'U', 0x0244: 'U',

  // accented letters that maps into 'V'
  0x0056: 'V', 0x24CB: 'V', 0xFF36: 'V', 0x1E7C: 'V',
  0x1E7E: 'V', 0x01B2: 'V', 0xA75E: 'V', 0x0245: 'V',

  // accented letters that maps into 'VY'
  0xA760: 'VY',

  // accented letters that maps into 'W'
  0x0057: 'W', 0x24CC: 'W', 0xFF37: 'W', 0x1E80: 'W',
  0x1E82: 'W', 0x0174: 'W', 0x1E86: 'W', 0x1E84: 'W',
  0x1E88: 'W', 0x2C72: 'W',

  // accented letters that maps into 'X'
  0x0058: 'X', 0x24CD: 'X', 0xFF38: 'X', 0x1E8A: 'X',
  0x1E8C: 'X',

  // accented letters that maps into 'Y'
  0x0059: 'Y', 0x24CE: 'Y', 0xFF39: 'Y', 0x1EF2: 'Y',
  0x00DD: 'Y', 0x0176: 'Y', 0x1EF8: 'Y', 0x0232: 'Y',
  0x1E8E: 'Y', 0x0178: 'Y', 0x1EF6: 'Y', 0x1EF4: 'Y',
  0x01B3: 'Y', 0x024E: 'Y', 0x1EFE: 'Y',

  // accented letters that maps into 'Z'
  0x005A: 'Z', 0x24CF: 'Z', 0xFF3A: 'Z', 0x0179: 'Z',
  0x1E90: 'Z', 0x017B: 'Z', 0x017D: 'Z', 0x1E92: 'Z',
  0x1E94: 'Z', 0x01B5: 'Z', 0x0224: 'Z', 0x2C7F: 'Z',
  0x2C6B: 'Z', 0xA762: 'Z',

  // accented letters that maps into 'a'
  0x0061: 'a', 0x24D0: 'a', 0xFF41: 'a', 0x1E9A: 'a',
  0x00E0: 'a', 0x00E1: 'a', 0x00E2: 'a', 0x1EA7: 'a',
  0x1EA5: 'a', 0x1EAB: 'a', 0x1EA9: 'a', 0x00E3: 'a',
  0x0101: 'a', 0x0103: 'a', 0x1EB1: 'a', 0x1EAF: 'a',
  0x1EB5: 'a', 0x1EB3: 'a', 0x0227: 'a', 0x01E1: 'a',
  0x00E4: 'a', 0x01DF: 'a', 0x1EA3: 'a', 0x00E5: 'a',
  0x01FB: 'a', 0x01CE: 'a', 0x0201: 'a', 0x0203: 'a',
  0x1EA1: 'a', 0x1EAD: 'a', 0x1EB7: 'a', 0x1E01: 'a',
  0x0105: 'a', 0x2C65: 'a', 0x0250: 'a',

  // accented letters that maps into 'aa'
  0xA733: 'aa',

  // accented letters that maps into 'ae'
  0x00E6: 'ae', 0x01FD: 'ae', 0x01E3: 'ae',

  // accented letters that maps into 'ao'
  0xA735: 'ao',

  // accented letters that maps into 'au'
  0xA737: 'au',

  // accented letters that maps into 'av'
  0xA739: 'av', 0xA73B: 'av',

  // accented letters that maps into 'ay'
  0xA73D: 'ay',

  // accented letters that maps into 'b'
  0x0062: 'b', 0x24D1: 'b', 0xFF42: 'b', 0x1E03: 'b',
  0x1E05: 'b', 0x1E07: 'b', 0x0180: 'b', 0x0183: 'b',
  0x0253: 'b',

  // accented letters that maps into 'c'
  0x0063: 'c', 0x24D2: 'c', 0xFF43: 'c', 0x0107: 'c',
  0x0109: 'c', 0x010B: 'c', 0x010D: 'c', 0x00E7: 'c',
  0x1E09: 'c', 0x0188: 'c', 0x023C: 'c', 0xA73F: 'c',
  0x2184: 'c',

  // accented letters that maps into 'd'
  0x0064: 'd', 0x24D3: 'd', 0xFF44: 'd', 0x1E0B: 'd',
  0x010F: 'd', 0x1E0D: 'd', 0x1E11: 'd', 0x1E13: 'd',
  0x1E0F: 'd', 0x0111: 'd', 0x018C: 'd', 0x0256: 'd',
  0x0257: 'd', 0xA77A: 'd',

  // accented letters that maps into 'dz'
  0x01F3: 'dz', 0x01C6: 'dz',

  // accented letters that maps into 'e'
  0x0065: 'e', 0x24D4: 'e', 0xFF45: 'e', 0x00E8: 'e',
  0x00E9: 'e', 0x00EA: 'e', 0x1EC1: 'e', 0x1EBF: 'e',
  0x1EC5: 'e', 0x1EC3: 'e', 0x1EBD: 'e', 0x0113: 'e',
  0x1E15: 'e', 0x1E17: 'e', 0x0115: 'e', 0x0117: 'e',
  0x00EB: 'e', 0x1EBB: 'e', 0x011B: 'e', 0x0205: 'e',
  0x0207: 'e', 0x1EB9: 'e', 0x1EC7: 'e', 0x0229: 'e',
  0x1E1D: 'e', 0x0119: 'e', 0x1E19: 'e', 0x1E1B: 'e',
  0x0247: 'e', 0x025B: 'e', 0x01DD: 'e',

  // accented letters that maps into 'f'
  0x0066: 'f', 0x24D5: 'f', 0xFF46: 'f', 0x1E1F: 'f',
  0x0192: 'f', 0xA77C: 'f',

  // accented letters that maps into 'g'
  0x0067: 'g', 0x24D6: 'g', 0xFF47: 'g', 0x01F5: 'g',
  0x011D: 'g', 0x1E21: 'g', 0x011F: 'g', 0x0121: 'g',
  0x01E7: 'g', 0x0123: 'g', 0x01E5: 'g', 0x0260: 'g',
  0xA7A1: 'g', 0x1D79: 'g', 0xA77F: 'g',

  // accented letters that maps into 'h'
  0x0068: 'h', 0x24D7: 'h', 0xFF48: 'h', 0x0125: 'h',
  0x1E23: 'h', 0x1E27: 'h', 0x021F: 'h', 0x1E25: 'h',
  0x1E29: 'h', 0x1E2B: 'h', 0x1E96: 'h', 0x0127: 'h',
  0x2C68: 'h', 0x2C76: 'h', 0x0265: 'h',

  // accented letters that maps into 'hv'
  0x0195: 'hv',

  // accented letters that maps into 'i'
  0x0069: 'i', 0x24D8: 'i', 0xFF49: 'i', 0x00EC: 'i',
  0x00ED: 'i', 0x00EE: 'i', 0x0129: 'i', 0x012B: 'i',
  0x012D: 'i', 0x00EF: 'i', 0x1E2F: 'i', 0x1EC9: 'i',
  0x01D0: 'i', 0x0209: 'i', 0x020B: 'i', 0x1ECB: 'i',
  0x012F: 'i', 0x1E2D: 'i', 0x0268: 'i', 0x0131: 'i',

  // accented letters that maps into 'j'
  0x006A: 'j', 0x24D9: 'j', 0xFF4A: 'j', 0x0135: 'j',
  0x01F0: 'j', 0x0249: 'j',

  // accented letters that maps into 'k'
  0x006B: 'k', 0x24DA: 'k', 0xFF4B: 'k', 0x1E31: 'k',
  0x01E9: 'k', 0x1E33: 'k', 0x0137: 'k', 0x1E35: 'k',
  0x0199: 'k', 0x2C6A: 'k', 0xA741: 'k', 0xA743: 'k',
  0xA745: 'k', 0xA7A3: 'k',

  // accented letters that maps into 'l'
  0x006C: 'l', 0x24DB: 'l', 0xFF4C: 'l', 0x0140: 'l',
  0x013A: 'l', 0x013E: 'l', 0x1E37: 'l', 0x1E39: 'l',
  0x013C: 'l', 0x1E3D: 'l', 0x1E3B: 'l', 0x017F: 'l',
  0x0142: 'l', 0x019A: 'l', 0x026B: 'l', 0x2C61: 'l',
  0xA749: 'l', 0xA781: 'l', 0xA747: 'l',

  // accented letters that maps into 'lj'
  0x01C9: 'lj',

  // accented letters that maps into 'm'
  0x006D: 'm', 0x24DC: 'm', 0xFF4D: 'm', 0x1E3F: 'm',
  0x1E41: 'm', 0x1E43: 'm', 0x0271: 'm', 0x026F: 'm',

  // accented letters that maps into 'n'
  0x006E: 'n', 0x24DD: 'n', 0xFF4E: 'n', 0x01F9: 'n',
  0x0144: 'n', 0x00F1: 'n', 0x1E45: 'n', 0x0148: 'n',
  0x1E47: 'n', 0x0146: 'n', 0x1E4B: 'n', 0x1E49: 'n',
  0x019E: 'n', 0x0272: 'n', 0x0149: 'n', 0xA791: 'n',
  0xA7A5: 'n',

  // accented letters that maps into 'nj'
  0x01CC: 'nj',

  // accented letters that maps into 'o'
  0x006F: 'o', 0x24DE: 'o', 0xFF4F: 'o', 0x00F2: 'o',
  0x00F3: 'o', 0x00F4: 'o', 0x1ED3: 'o', 0x1ED1: 'o',
  0x1ED7: 'o', 0x1ED5: 'o', 0x00F5: 'o', 0x1E4D: 'o',
  0x022D: 'o', 0x1E4F: 'o', 0x014D: 'o', 0x1E51: 'o',
  0x1E53: 'o', 0x014F: 'o', 0x022F: 'o', 0x0231: 'o',
  0x00F6: 'o', 0x022B: 'o', 0x1ECF: 'o', 0x0151: 'o',
  0x01D2: 'o', 0x020D: 'o', 0x020F: 'o', 0x01A1: 'o',
  0x1EDD: 'o', 0x1EDB: 'o', 0x1EE1: 'o', 0x1EDF: 'o',
  0x1EE3: 'o', 0x1ECD: 'o', 0x1ED9: 'o', 0x01EB: 'o',
  0x01ED: 'o', 0x00F8: 'o', 0x01FF: 'o', 0x0254: 'o',
  0xA74B: 'o', 0xA74D: 'o', 0x0275: 'o',

  // accented letters that maps into 'oi'
  0x01A3: 'oi',

  // accented letters that maps into 'ou'
  0x0223: 'ou',

  // accented letters that maps into 'oo'
  0xA74F: 'oo',

  // accented letters that maps into 'p'
  0x0070: 'p', 0x24DF: 'p', 0xFF50: 'p', 0x1E55: 'p',
  0x1E57: 'p', 0x01A5: 'p', 0x1D7D: 'p', 0xA751: 'p',
  0xA753: 'p', 0xA755: 'p',

  // accented letters that maps into 'q'
  0x0071: 'q', 0x24E0: 'q', 0xFF51: 'q', 0x024B: 'q',
  0xA757: 'q', 0xA759: 'q',
  0x0072: 'r', 0x24E1: 'r', 0xFF52: 'r', 0x0155: 'r',
  0x1E59: 'r', 0x0159: 'r', 0x0211: 'r', 0x0213: 'r',
  0x1E5B: 'r', 0x1E5D: 'r', 0x0157: 'r', 0x1E5F: 'r',
  0x024D: 'r', 0x027D: 'r', 0xA75B: 'r', 0xA7A7: 'r',
  0xA783: 'r',

  // accented letters that maps into 's'
  0x0073: 's', 0x24E2: 's', 0xFF53: 's', 0x00DF: 's',
  0x015B: 's', 0x1E65: 's', 0x015D: 's', 0x1E61: 's',
  0x0161: 's', 0x1E67: 's', 0x1E63: 's', 0x1E69: 's',
  0x0219: 's', 0x015F: 's', 0x023F: 's', 0xA7A9: 's',
  0xA785: 's', 0x1E9B: 's',

  // accented letters that maps into 't'
  0x0074: 't', 0x24E3: 't', 0xFF54: 't', 0x1E6B: 't',
  0x1E97: 't', 0x0165: 't', 0x1E6D: 't', 0x021B: 't',
  0x0163: 't', 0x1E71: 't', 0x1E6F: 't', 0x0167: 't',
  0x01AD: 't', 0x0288: 't', 0x2C66: 't', 0xA787: 't',

  // accented letters that maps into 'tz'
  0xA729: 'tz',

  // accented letters that maps into 'u'
  0x0075: 'u', 0x24E4: 'u', 0xFF55: 'u', 0x00F9: 'u',
  0x00FA: 'u', 0x00FB: 'u', 0x0169: 'u', 0x1E79: 'u',
  0x016B: 'u', 0x1E7B: 'u', 0x016D: 'u', 0x00FC: 'u',
  0x01DC: 'u', 0x01D8: 'u', 0x01D6: 'u', 0x01DA: 'u',
  0x1EE7: 'u', 0x016F: 'u', 0x0171: 'u', 0x01D4: 'u',
  0x0215: 'u', 0x0217: 'u', 0x01B0: 'u', 0x1EEB: 'u',
  0x1EE9: 'u', 0x1EEF: 'u', 0x1EED: 'u', 0x1EF1: 'u',
  0x1EE5: 'u', 0x1E73: 'u', 0x0173: 'u', 0x1E77: 'u',
  0x1E75: 'u', 0x0289: 'u',

  // accented letters that maps into 'v'
  0x0076: 'v', 0x24E5: 'v', 0xFF56: 'v', 0x1E7D: 'v',
  0x1E7F: 'v', 0x028B: 'v', 0xA75F: 'v', 0x028C: 'v',

  // accented letters that maps into 'vy'
  0xA761: 'vy',

  // accented letters that maps into 'w'
  0x0077: 'w', 0x24E6: 'w', 0xFF57: 'w', 0x1E81: 'w',
  0x1E83: 'w', 0x0175: 'w', 0x1E87: 'w', 0x1E85: 'w',
  0x1E98: 'w', 0x1E89: 'w', 0x2C73: 'w',

  // accented letters that maps into 'x'
  0x0078: 'x', 0x24E7: 'x', 0xFF58: 'x', 0x1E8B: 'x',
  0x1E8D: 'x',

  // accented letters that maps into 'y'
  0x0079: 'y', 0x24E8: 'y', 0xFF59: 'y', 0x1EF3: 'y',
  0x00FD: 'y', 0x0177: 'y', 0x1EF9: 'y', 0x0233: 'y',
  0x1E8F: 'y', 0x00FF: 'y', 0x1EF7: 'y', 0x1E99: 'y',
  0x1EF5: 'y', 0x01B4: 'y', 0x024F: 'y', 0x1EFF: 'y',

  // accented letters that maps into 'z'
  0x007A: 'z', 0x24E9: 'z', 0xFF5A: 'z', 0x017A: 'z',
  0x1E91: 'z', 0x017C: 'z', 0x017E: 'z', 0x1E93: 'z',
  0x1E95: 'z', 0x01B6: 'z', 0x0225: 'z', 0x0240: 'z',
  0x2C6C: 'z', 0xA763: 'z',
}


// returns a new string by exchanging the diacrylics of str by its latin
// counterparts, leaving untouched all other non Latim "characters"
pub fn normalize_latin(str string) string {
  rune_list := str.runes()
  mut str_aux := ''
  for rune_aux in rune_list {
    if letter := convertibles[u32(rune_aux)] {
        str_aux += letter
    } else {
        str_aux += rune_aux.str()
    }
  }
  return str_aux
}
