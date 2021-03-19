# Elixir gRPC Playground

Two examples with a single Elixir client

- Elixir client can make unary requests to a separate Elixir server that will do some simple calculations
- Elixir client can subscribe to a stream of Bitcoin prices sent from a Node server

## Proto generation
 
Make changes to proto files in `./protos/`
 
Running `sh gen_proto.sh` will generate all Node and Elixir code for the communication logic.

## Starting servers

Bash 1:

```bash
cd grpc_server_node && npm i
```

```bash
npm run develop
```

Bash 2:

```bash
cd grpc_server_ex && mix deps.get
```

```bash
iex -S mix
```

## Running commands

Bash 3:

```bash
cd grpc_client && mix deps.get
```

```bash
iex -S mix
```

```bash
ClientApp.sum 5, 5
```

```bash
ClientApp.sub 50, 5
```

```bash
ClientApp.btc_subscribe
```

## TODO

- [ x ] gRPC Node server
- [ x ] Handle server push events with http2 streams
- [ x ] Generate stubs for client app from all server .proto files
