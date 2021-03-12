# Calculator

Basic calculator server to test gRPC and Protocol Buffers. 

## Running the server

```bash
mix deps.get
```

```bash
mix grpc.server
```

or if you want an iex shell

```bash
iex -S mix
```

A gRPC server will be started at `http://0.0.0.0:50051`
