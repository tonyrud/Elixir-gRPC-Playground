const grpc = require("@grpc/grpc-js");
const server = new grpc.Server();

const exchange = require("./protos/crypto_exchange_pb");
const exchangeService = require("./protos/crypto_exchange_grpc_pb");
const PORT = process.env.PORT || 50052
const SERVER_PATH = `0.0.0.0:${PORT}`

function callStream() {
  const client = new exchangeService.CryptoExchangeClient(
    "localhost:50051",
    grpc.credentials.createInsecure()
  );

  const request = new exchange.CryptoInput();

  const call = client.subscribe(request, () => {});

  call.on("data", response => {
    console.log("Stream Found: ", response.getCurrent());
  });

  call.on("error", error => {
    console.error(error);
  });

  call.on("status", status => {
    console.log("status", status);
  });

  call.on("end", () => {
    console.log("Streaming Ended!");
  });
}

callStream()

