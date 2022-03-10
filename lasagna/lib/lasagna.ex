defmodule Lasagna do
  @oven_minutes 40
  @layers 2
  def expected_minutes_in_oven, do: @oven_minutes

  def remaining_minutes_in_oven(minutes) when is_integer(minutes) do
    expected_minutes_in_oven() - minutes
  end

  def remaining_minutes_in_oven(_minutes), do: expected_minutes_in_oven()
  def preparation_time_in_minutes(layers) when is_integer(layers), do: layers * @layers
  def preparation_time_in_minutes(_layers), do: 0

  def total_time_in_minutes(layers, minutes) do
    preparation_time_in_minutes(layers) + minutes
  end

  def alarm, do: "Ding!"
end
