defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode([]), do: <<>>
  def encode([head | rest]), do: <<encode_nucleotide(head)::4, encode(rest)::bitstring>>

  def decode(dna), do: do_decode(dna, '')

  defp do_decode(<<head::4, rest::bitstring>>, list) do
    letter =
      case decode_nucleotide(head) do
        ?\s -> ' '
        ?A -> 'A'
        ?C -> 'C'
        ?G -> 'G'
        ?T -> 'T'
      end

    do_decode(<<rest::bitstring>>, list ++ letter)
  end

  defp do_decode(<<_head::bitstring>>, list), do: list
end
