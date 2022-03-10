defmodule LibraryFees do
  @spec datetime_from_string(String.t()) :: NaiveDateTime.t()
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  @spec before_noon?(NaiveDateTime.t()) :: boolean()
  def before_noon?(datetime) do
    NaiveDateTime.to_time(datetime)
    |> Time.compare(Time.new!(12, 0, 0, 0))
    |> case do
      :lt -> true
      _ -> false
    end
  end

  @spec return_date(NaiveDateTime.t()) :: Date.t()
  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      NaiveDateTime.to_date(checkout_datetime) |> Date.add(28)
    else
      NaiveDateTime.to_date(checkout_datetime) |> Date.add(29)
    end
  end

  @spec days_late(Date.t(), NaiveDateTime.t()) :: integer()
  def days_late(planned_return_date, actual_return_datetime) do
    days =
      NaiveDateTime.to_date(actual_return_datetime)
      |> Date.diff(planned_return_date)

    if days > 0, do: days, else: 0
  end

  @spec monday?(NaiveDateTime.t()) :: boolean()
  def monday?(datetime) do
    day = NaiveDateTime.to_date(datetime) |> Date.day_of_week()
    if day == 1, do: true, else: false
  end

  @spec calculate_late_fee(String.t(), String.t(), integer()) :: integer()
  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = datetime_from_string(checkout) |> return_date()
    actual_return_datetime = datetime_from_string(return)

    discount = if monday?(actual_return_datetime), do: 0.5, else: 1

    (days_late(planned_return_date, actual_return_datetime) * rate * discount)
    |> floor()
  end
end
