# Encrypted Pioneers
# The following list contains the names of individuals who are
# pioneers in the field of computing or that have had a
# significant influence on the field. The names are in an
# encrypted form, though, using a simple (and incredibly weak)
# form of encryption called Rot13.

names = [
'Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu'
]

UPCASE_ASCII_OFFSET = 65
DOWNCASE_ASCII_OFFSET = 97
CIPHER_OFFSET = 13
LETTERS_IN_ALPHABET = 26

def decrypt(name)
  name.chars.map do |char|
    case char
    when /[a-z]/
      ascii_offset = DOWNCASE_ASCII_OFFSET
      ((char.ord - ascii_offset + CIPHER_OFFSET) % LETTERS_IN_ALPHABET + ascii_offset).chr
    when /[A-Z]/
      ascii_offset = UPCASE_ASCII_OFFSET
      ((char.ord - ascii_offset + CIPHER_OFFSET) % LETTERS_IN_ALPHABET + ascii_offset).chr
    else
      char
    end
  end.join
end

names.each { |name| puts decrypt(name) }
