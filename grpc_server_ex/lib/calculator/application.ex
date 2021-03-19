defmodule Calculator.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {GRPC.Server.Supervisor, {Calculator.Endpoint, 50051}}
    ]

    opts = [strategy: :one_for_one, name: Calculator.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
