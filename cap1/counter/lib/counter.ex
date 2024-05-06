defmodule Counter do
  @moduledoc """
  Documentation for `Counter`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Counter.hello()
      :world

  """
  def hello do
    :world
  end

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
