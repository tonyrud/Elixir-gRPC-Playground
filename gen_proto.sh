#!/bin/bash
set -e

protoc --elixir_out=plugins=grpc:./grpc_server_ex/lib ./protos/*.proto 

# protoc  --js_out=import_style=commonjs,binary:grpc_server_node/src/ ./protos/*.proto
npx grpc_tools_node_protoc \
  --js_out=import_style=commonjs,binary:./grpc_server_node/src/protos \
  --grpc_out=./grpc_server_node/src/protos \
  -I=./protos ./protos/*.proto