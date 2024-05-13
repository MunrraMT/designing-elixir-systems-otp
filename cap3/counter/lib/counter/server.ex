defmodule Counter.Server do
  def run(count) do
    count
    |> listen()
    |> run()
  end

  def listen(count) do
    receive do
      {:tick, _pid} ->
        Counter.Core.inc(count)

      {:state, pid} ->
        send(pid, {:count, count})
        count
    end
  end
end
