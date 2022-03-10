defmodule OcrNumbers do
  @doc """
  Given a 3 x 4 grid of pipes, underscores, and spaces, determine which number is represented, or
  whether it is garbled.
  """
  @spec convert([String.t()]) :: {:ok, String.t()} | {:error, charlist()}
  def convert(input) do
    cond do
      length(input) |> rem(4) != 0 ->
        {:error, 'invalid line count'}

      Enum.any?(input, fn x -> String.length(x) |> rem(3) != 0 end) ->
        {:error, 'invalid column count'}

      true ->
        number =
          input
          |> Enum.chunk_every(4)
          |> Enum.map(fn x -> do_convert(x, "") end)
          |> Enum.join(",")

        {:ok, number}
    end
  end

  defp do_convert(["", "", "", ""], ocr), do: ocr

  defp do_convert(input, ocr) do
    digit =
      Enum.reduce(input, [], fn x, acc ->
        acc ++ [String.slice(x, 0..2)]
      end)
      |> do_digit()

    rest =
      Enum.reduce(input, [], fn x, acc ->
        acc ++ [String.slice(x, 3..(String.length(x) - 1))]
      end)

    do_convert(rest, ocr <> digit)
  end

  defp do_digit([" _ ", "| |", "|_|", "   "]), do: "0"
  defp do_digit(["   ", "  |", "  |", "   "]), do: "1"
  defp do_digit([" _ ", " _|", "|_ ", "   "]), do: "2"
  defp do_digit([" _ ", " _|", " _|", "   "]), do: "3"
  defp do_digit(["   ", "|_|", "  |", "   "]), do: "4"
  defp do_digit([" _ ", "|_ ", " _|", "   "]), do: "5"
  defp do_digit([" _ ", "|_ ", "|_|", "   "]), do: "6"
  defp do_digit([" _ ", "  |", "  |", "   "]), do: "7"
  defp do_digit([" _ ", "|_|", "|_|", "   "]), do: "8"
  defp do_digit([" _ ", "|_|", " _|", "   "]), do: "9"
  defp do_digit(_), do: "?"
end
