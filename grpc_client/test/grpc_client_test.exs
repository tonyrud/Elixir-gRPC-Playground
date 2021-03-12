defmodule ClientAppTest do
  use ExUnit.Case
  doctest ClientApp

  test "greets the world" do
    assert ClientApp.hello() == :world
  end
end
