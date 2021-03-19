# Elixir gRPC Playground

## Starting servers

Bash 1:

```bash
cd grpc_server_node && npm run develop
```

Bash 2:

```bash
cd grpc_server_ex && iex -S mix
```

## Running commands

Bash 3:

```bash
cd grpc_client && iex -S mix
```

```bash
iex> ClientApp.sum 5, 5
```

```bash
iex> ClientApp.sub 50, 5
```

```bash
iex> ClientApp.btc_subscribe
```

## TODO

- [ x ] gRPC Node server
- [ x ] Handle server push events with http2 streams
- [ x ] Generate stubs for client app from all server .proto files
