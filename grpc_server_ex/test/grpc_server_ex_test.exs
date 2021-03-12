defmodule GrpcServerExTest do
  use ExUnit.Case
  doctest GrpcServerEx

  test "greets the world" do
    assert GrpcServerEx.hello() == :world
  end
end
