defmodule Calculator.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)
  run(Crypto.Server)
end
