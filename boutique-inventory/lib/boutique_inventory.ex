defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn x -> x.price end)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn x -> is_nil(x.price) end)
  end

  def increase_quantity(item, count) do
    new_quantity_by_size =
      Enum.map(item.quantity_by_size, & &1)
      |> Enum.into(%{}, fn {k, v} -> {k, v + count} end)

    %{item | quantity_by_size: new_quantity_by_size}
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_size, count}, acc -> acc + count end)
  end
end
