defmodule FreelancerRates do
  @rate 8.0
  @days 22
  def daily_rate(hourly_rate) do
    hourly_rate * @rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (100 - discount) / 100
  end

  def monthly_rate(hourly_rate, discount) do
    (apply_discount(daily_rate(hourly_rate), discount) * @days)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget / apply_discount(daily_rate(hourly_rate), discount))
    |> Float.floor(1)
  end
end
