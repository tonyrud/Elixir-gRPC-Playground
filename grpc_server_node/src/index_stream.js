const grpc = require("@grpc/grpc-js");
var server = new grpc.Server();

var exchange = require("./protos/crypto_exchange_pb");
var exchangeService = require("./protos/crypto_exchange_grpc_pb");
const PORT = process.env.PORT || 50052
const SERVER_PATH = `0.0.0.0:${PORT}`

function sum(call, callback) {
  var exchangeResponse = new calculator.CalculatorReply();

  sumResponse.setResult(result);

  console.log('called add with args', call.request.array)

  callback(null, sumResponse);
}

function callStream() {
  var client = new exchangeService.CryptoExchangeClient(
    "localhost:50051",
    grpc.credentials.createInsecure()
  );

  var request = new exchange.CryptoInput();

  var call = client.subscribe(request, () => {});

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


// server.addService(calcService.CalculatorService, {
//   sum: sum,
//   subtract: subtract
// });

// server.bindAsync(SERVER_PATH, grpc.ServerCredentials.createInsecure(), () => {
//   server.start();
//   console.log(`Server running on ${SERVER_PATH}`);
// });

