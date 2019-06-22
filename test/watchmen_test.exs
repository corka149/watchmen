defmodule WatchmenTest do
  use ExUnit.Case
  doctest Watchmen

  test "greets the world" do
    assert Watchmen.hello() == :world
  end
end
