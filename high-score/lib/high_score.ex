defmodule HighScore do
  @default 0
  def new(), do: %{}

  def add_player(scores, name, score \\ @default)
  def add_player(scores, name, score), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.drop(scores, [name])

  def reset_score(scores, name) do
    Map.update(scores, name, @default, fn _x -> @default end)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn x -> x + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
