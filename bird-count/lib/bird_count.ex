defmodule BirdCount do
  def today([]), do: nil
  def today([today | _list]), do: today

  def increment_day_count([]), do: [1]

  def increment_day_count(list) do
    [head | rest] = list
    [head + 1 | rest]
  end

  def has_day_without_birds?(list, flag \\ false)
  def has_day_without_birds?(_list, true), do: true
  def has_day_without_birds?([], _flag), do: false

  def has_day_without_birds?(list, _flag) when is_list(list) do
    [head | rest] = list
    no_birds = if head == 0, do: true, else: false
    has_day_without_birds?(rest, no_birds)
  end

  def total(list, total \\ 0)
  def total([], total), do: total

  def total(list, total) do
    [head | rest] = list
    total(rest, total + head)
  end

  def busy_days(list, count \\ 0)
  def busy_days([], count), do: count

  def busy_days(list, count) do
    [head | rest] = list
    count = if head >= 5, do: count + 1, else: count
    busy_days(rest, count)
  end
end
