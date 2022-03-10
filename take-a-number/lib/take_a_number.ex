defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(%{number: 0}) end)
  end

  defp loop(%{number: number} = state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, number)
        loop(state)

      {:take_a_number, sender_pid} ->
        send(sender_pid, number + 1)
        loop(%{number: number + 1})

      :stop ->
        :ok

      _ ->
        loop(state)
    end
  end
end
