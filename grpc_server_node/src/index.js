const grpc = require("@grpc/grpc-js");
var server = new grpc.Server();

var calculator = require("./protos/calculator_pb");
const port = process.env.SERVER_PORT || 500052

function sum(call, callback) {
  console.log('CALL: ', call)
  var sumResponse = new calculator.CalculatorReply();

  // sumResponse.setSumResult(
  //   call.request.getFirstNumber() + call.request.getSecondNumber()
  // );

  callback(null, sumResponse);
}

console.log(calculator)

server.addService(calculator.Calculator, {
  sum: sum
});

server.bindAsync(`0.0.0.0:${port}`, grpc.ServerCredentials.createInsecure(), () => {
  console.log('WAT')
  // var argv = parseArgs(process.argv, {
  //   string: 'db_path'
  // });
  // fs.readFile(path.resolve(argv.db_path), function(err, data) {
  //   if (err) throw err;
  //   feature_list = JSON.parse(data);
  // });
  server.start();
  console.log(`Server running on port 127.0.0.1:${port}`);
});
