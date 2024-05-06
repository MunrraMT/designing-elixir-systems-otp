defmodule CounterApiTest do
  use ExUnit.Case, async: true

  test "use counter through api" do
    pid = Counter.start()
    assert Counter.state(pid) == 0

    Counter.tick(pid)
    Counter.tick(pid)

    count = Counter.state(pid)
    assert count == 2
  end
end
