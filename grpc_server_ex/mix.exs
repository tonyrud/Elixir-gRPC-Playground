defmodule Calculator.MixProject do
  use Mix.Project

  def project do
    [
      app: :grpc_server_ex,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Calculator.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, github: "elixir-grpc/grpc"},
      {:cowlib, "~> 2.9.0", override: true},
      {:gun, "~> 2.0.0", hex: :grpc_gun, override: true},
      {:jason, "~> 1.2"}
    ]
  end
end
