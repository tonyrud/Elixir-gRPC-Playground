defmodule Calculator.Server do
  use GRPC.Server, service: Calculator.Service
  require Logger

  def sum(%{num1: num1, num2: num2} = params, _stream) do
    result = num1 + num2

    Logger.info("Running 'add' on Elixir server with params: #{inspect(params)}")

    CalculatorReply.new(result: result)
  end

  def subtract(%{num1: num1, num2: num2} = params, _stream) do
    result = num1 - num2

    Logger.info("Running 'subtract' on Elixir server with params: #{inspect(params)}")

    CalculatorReply.new(result: result)
  end
end
