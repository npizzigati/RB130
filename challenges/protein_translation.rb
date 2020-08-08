# Protein Translation

# Lets write a program that will translate RNA sequences into
# proteins. RNA can be broken into three nucleotide sequences
# called codons, and then translated to a polypeptide like so:

# RNA: "AUGUUUUCU" => translates to

# Codons: "AUG", "UUU", "UCU"
# => which become a polypeptide with the following sequence =>

# Protein: "Methionine", "Phenylalanine", "Serine"
# There are 64 codons which in turn correspond to 20 amino acids;
# however, all of the codon sequences and resulting amino acids
# are not important in this exercise.

# There are also four terminating codons (also known as 'STOP'
# codons); if any of these codons are encountered (by the
# ribosome), all translation ends and the protein is
# terminated. All subsequent codons after are ignored, like this:

# RNA: "AUGUUUUCUUAAAUG" =>

# Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

# Protein: "Methionine", "Phenylalanine", "Serine"
# Note the stop codon terminates the translation and the final
# methionine is not translated into the protein sequence.--

# Below are the codons and resulting Amino Acids needed for the
# exercise.

# Codon	Amino Acids
# AUG	Methionine
# UUU, UUC	Phenylalanine
# UUA, UUG	Leucine
# UCU, UCC, UCA, UCG	Serine
# UAU, UAC	Tyrosine
# UGU, UGC	Cysteine
# UGG	Tryptophan
# UAA, UAG, UGA	STOP

# Input: String
# Output: String (#of_codon); Array<String> (#of_rna)
# Rules: Explicit:
# Output string is the translation of the codon, or rna sequence,
# as appropriate
# Translation should stop at stop sequences, and no further
# codons should be translated
# Implicit:
# Raise "InvalidCodonError" if String submitted in #of_rna is
# invalid; apparently no error correction in #of_codon
# Questions: Should there be input validation in #of_codon?
# Approach:
# #of_codon:
# Return 'STOP' if codon in array of stop codons
# Look up codon string in hash of regex
# Raise invalid codon error if codon not found
# #of_rna:
# Divide RNA strand in 3 char segments
#   - Convert to array; Iterate over array and enter each 3 char
#     group into a results array ('codons'), after joining.
# Run each codon through #of_codon and save results in array (use map)

class InvalidCodonError < StandardError; end

class Translation
  SEQUENCES = {/AUG/ => 'Methionine',
               /UU[UC]/ => 'Phenylalanine',
               /UU[GA]/ => 'Leucine',
               /UC[UCAG]/ => 'Serine',
               /UA[UC]/ => 'Tyrosine',
               /UG[UC]/ => 'Cysteine',
               /UGG/ => 'Tryptophan',
               /UAA|UAG|UGA/ => 'STOP'}

  CODON_LENGTH = 3

  def self.of_codon(codon)
    codon = SEQUENCES.select { |k, _| k =~ codon }.values.first
    raise InvalidCodonError if codon.nil?
    codon
  end

  def self.of_rna(strand)
    codons = strand.scan(/.{#{CODON_LENGTH}}/)
    codons.map { |codon| of_codon(codon) }
          .take_while { |codon| codon != 'STOP' }
  end

end
