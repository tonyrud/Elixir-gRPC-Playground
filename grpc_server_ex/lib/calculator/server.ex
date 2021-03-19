defmodule Crypto.Server do
  use GRPC.Server, service: CryptoExchange.Service
  require Logger

  alias Crypto.CoinbaseClient

  def subscribe(_params, stream) do
    IO.inspect(stream, label: "received stream!")
    CoinbaseClient.start_link({["BTC-USD"], stream})

    # GRPC.Server.send_reply(stream, CryptoResponse.new(current: 13.15))
    # GRPC.Server.send_reply(stream, CryptoResponse.new(current: 13.16))
    # Enum.each(0..100, fn i ->
    #   GRPC.Server.send_reply(stream, CryptoResponse.new(current: 10.0 * i))
    # end)
  end
end
