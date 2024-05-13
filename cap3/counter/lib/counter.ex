defmodule Counter do
  def start(initial_count \\ 0) do
    spawn(fn -> Counter.Server.run(initial_count) end)
  end

  def tick(pid) do
    send(pid, {:tick, self()})
  end

  def state(pid) do
    send(pid, {:state, self()})

    receive do
      {:count, value} ->
        value
    end
  end
end
