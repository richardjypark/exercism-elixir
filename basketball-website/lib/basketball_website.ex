defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    path
    |> String.split(".")
    |> Enum.reduce(data, fn x, acc -> acc[x] end)
  end

  def get_in_path(data, path) do
    data
    |> Kernel.get_in(String.split(path, "."))
  end
end
