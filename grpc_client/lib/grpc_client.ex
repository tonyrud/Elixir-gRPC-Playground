defmodule ClientApp do
  @moduledoc """
  Documentation for `ClientApp`.
  """

  @elixir_server_port 50051
  @node_server_port 50052

  @doc """
  Run add on gRPC server.

  Defaults missing args to `nil` values. These will be eval as 0 through rpc params.

  ## Examples

      iex> ClientApp.add(2, 3)
      5

      iex> ClientApp.add(22)
      22

  """
  def add(num1 \\ nil, num2 \\ nil) do
    {:ok, channel} = GRPC.Stub.connect("0.0.0.0:#{@node_server_port}")

    params = CalculatorParams.new(num1: num1, num2: num2)

    channel
    |> Calculator.Stub.sum(params)
    |> handle_result()
  end

  def subtract(num1 \\ nil, num2 \\ nil) do
    {:ok, channel} = GRPC.Stub.connect("localhost:#{@node_server_port}")

    params = CalculatorParams.new(num1: num1, num2: num2)

    channel
    |> Calculator.Stub.subtract(params)
    |> handle_result()
  end

  defp handle_result({:ok, %CalculatorReply{result: result}}), do: result
  defp handle_result(error), do: error

  def btc_subscribe() do
    {:ok, channel} = GRPC.Stub.connect("localhost:#{@elixir_server_port}")

    params = CryptoInput.new()

    {:ok, stream} = channel
    |> CryptoExchange.Stub.subscribe(params)


    Enum.each(stream, fn {:ok, %CryptoResponse{current: current}} ->
      IO.inspect(current, label: "CURRENT PRICE")
    end)
  end
end
