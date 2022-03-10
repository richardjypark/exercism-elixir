defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)
  def compare(x, x), do: "Correct"
  def compare(secret_number, guess) when secret_number == guess - 1, do: "So close"
  def compare(secret_number, guess) when secret_number == guess + 1, do: "So close"

  def compare(secret_number, guess) when secret_number < guess and is_number(guess),
    do: "Too high"

  def compare(secret_number, guess) when secret_number > guess and is_number(guess), do: "Too low"
  def compare(_secret_number, _guess), do: "Make a guess"
end
