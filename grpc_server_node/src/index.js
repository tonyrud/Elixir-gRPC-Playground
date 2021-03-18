const grpc = require("@grpc/grpc-js");
var server = new grpc.Server();

var calculator = require("./protos/calculator_pb");
var calcService = require("./protos/calculator_grpc_pb");
const PORT = process.env.PORT || 50052
const SERVER_PATH = `0.0.0.0:${PORT}`

function sum(call, callback) {
  var sumResponse = new calculator.CalculatorReply();

  const num1 = call.request.getNum1()
  const num2 = call.request.getNum2()
  const result = num1 + num2

  sumResponse.setResult(result);

  console.log('called add with args', call.request.array)

  callback(null, sumResponse);
}

function subtract(call, callback) {
  var sumResponse = new calculator.CalculatorReply();

  const num1 = call.request.getNum1()
  const num2 = call.request.getNum2()
  const result = num1 - num2

  console.log('called subtract with args', call.request.array)

  sumResponse.setResult(result);

  callback(null, sumResponse);
}


server.addService(calcService.CalculatorService, {
  sum: sum,
  subtract: subtract
});

server.bindAsync(SERVER_PATH, grpc.ServerCredentials.createInsecure(), () => {
  server.start();
  console.log(`Server running on ${SERVER_PATH}`);
});
