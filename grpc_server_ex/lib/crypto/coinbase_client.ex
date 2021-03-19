defmodule Crypto.CoinbaseClient do
  use GenServer

  def start_link(args, options \\ []) do
    GenServer.start_link(__MODULE__, args, options)
  end

  def init({currency_pairs, stream}) do
    state = %{
      currency_pairs: currency_pairs,
      stream: stream,
      conn: nil
    }

    {:ok, state, {:continue, :connect}}
  end

  def handle_continue(:connect, state) do
    updated_state = connect(state)

    {:noreply, updated_state}
  end

  def server_host, do: 'ws-feed.pro.coinbase.com'
  def server_port, do: 443

  def connect(state) do
    {:ok, conn} = :gun.open(server_host(), server_port(), %{protocols: [:http]})
    %{state | conn: conn}
  end

  # gun lib will send these messages back
  def handle_info({:gun_up, conn, :http}, %{conn: conn} = state) do
    :gun.ws_upgrade(state.conn, "/")
    {:noreply, state}
  end

  def handle_info(
        {:gun_upgrade, conn, _ref, ["websocket"], _headers},
        %{conn: conn} = state
      ) do
    subscribe(state)
    {:noreply, state}
  end

  def handle_info(
        {:gun_ws, conn, _ref, {:text, msg} = _frame},
        %{conn: conn} = state
      ) do
    handle_ws_message(Jason.decode!(msg), state)
  end

  defp subscribe(state) do
    # subscription frames
    # send subscription frames to coinbase
    state.currency_pairs
    |> subscription_frames()
    |> Enum.each(&:gun.ws_send(state.conn, &1))
  end

  def subscription_frames(currency_pairs) do
    msg =
      %{
        "type" => "subscribe",
        "product_ids" => currency_pairs,
        "channels" => ["ticker"]
      }
      |> Jason.encode!()

    [{:text, msg}]
  end

  def handle_ws_message(%{"type" => "ticker", "price" => current_price} = _btc_msg, state) do
    current_price =
      if String.contains?(current_price, ".") do
        String.to_float(current_price)
      else
        String.to_float(current_price <> ".0")
      end

    response = CryptoResponse.new(
      current: current_price
      )
      |> IO.inspect(label: "BTC RES")

    GRPC.Server.send_reply(state.stream, response)

    {:noreply, state}
  end

  def handle_ws_message(_msg, state) do
    # IO.inspect(msg, label: "unhandled message")
    {:noreply, state}
  end
end
