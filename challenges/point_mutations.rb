# Point Mutations
# Write a program that can calculate the Hamming distance between
# two DNA strands.

# A mutation is simply a mistake that occurs during the creation
# or copying of a nucleic acid, in particular DNA. Because
# nucleic acids are vital to cellular functions, mutations tend
# to cause a ripple effect throughout the cell. Although
# mutations are technically mistakes, a very rare mutation may
# equip the cell with a beneficial attribute. In fact, the macro
# effects of evolution are attributable by the accumulated result
# of beneficial microscopic mutations over many generations.

# The simplest and most common type of nucleic acid mutation is a
# point mutation, which replaces one base with another at a
# single nucleotide.

# By counting the number of differences between two homologous
# DNA strands taken from different genomes with a common
# ancestor, we get a measure of the minimum number of point
# mutations that could have occurred on the evolutionary path
# between the two strands.

# This is called the 'Hamming distance'

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal
# length. If you have two sequences of unequal length, you should
# compute the Hamming distance over the shorter length.

# Input: In constructor: string. In hamming_distance method: string
# Output: Integer
#
# Requirements:
# Explicit:
# - Output integer is the count of letter positions that
# contain different letters between the sequence passed into the
# constuctor and the sequence passed into the hamming_distance
# method.
# - If one sequence is longer than the other, use the shorter
# length for the comparison.
# Implicit:

# Approach: Check if strings are the same length. If not crop the
# longer one to the length of the shorter one. Convert each
# string into an array. Zip the arrays and call uniq on each
# pair. The elements with two elements remaining are the
# differences -- count these.

class DNA
  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    zipped_strands = @strand1.chars.zip(strand2.chars)
    zipped_strands.count { |pair| pair.uniq.size == 2 && !pair.include?(nil) }
  end

end
