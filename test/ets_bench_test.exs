defmodule EtsBenchTest do
  use ExUnit.Case
  doctest EtsBench

  test "greets the world" do
    assert EtsBench.hello() == :world
  end
end
