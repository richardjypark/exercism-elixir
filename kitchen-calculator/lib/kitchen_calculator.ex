defmodule KitchenCalculator do
  @cup 240
  @ounce 30
  @teaspoon 5
  @tablespoon 15
  def get_volume({_, v}), do: v
  def to_milliliter({:cup, volume}), do: {:milliliter, @cup * volume}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, @ounce * volume}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, @teaspoon * volume}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, @tablespoon * volume}
  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume}

  def from_milliliter({:milliliter, volume}, :cup), do: {:cup, volume / @cup}
  def from_milliliter({:milliliter, volume}, :fluid_ounce), do: {:fluid_ounce, volume / @ounce}
  def from_milliliter({:milliliter, volume}, :teaspoon), do: {:teaspoon, volume / @teaspoon}
  def from_milliliter({:milliliter, volume}, :tablespoon), do: {:tablespoon, volume / @tablespoon}
  def from_milliliter({_, volume}, _), do: {:milliliter, volume}

  def convert(volume_pair, unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)
end
