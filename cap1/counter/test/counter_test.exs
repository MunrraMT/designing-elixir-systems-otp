defmodule CounterTest do
  use ExUnit.Case, async: true

  test "should returns the value passed argument increase 1" do
    assert 11 == Counter.Core.inc(10)
  end
end
