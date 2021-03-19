defmodule Calculator.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)
  run(Calculator.Server)
end
