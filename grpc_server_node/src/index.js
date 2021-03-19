const grpc = require('@grpc/grpc-js');
const server = new grpc.Server();

var exchange = require('./protos/crypto_exchange_pb');
var exchangeService = require('./protos/crypto_exchange_grpc_pb');

const PORT = process.env.PORT || 50052;
const SERVER_PATH = `0.0.0.0:${PORT}`;

function subscribe(call, callback) {
  const WebSocket = require('ws');

  const ws = new WebSocket('wss://ws-feed.pro.coinbase.com');

  ws.on('open', function open() {
    console.log('connected');
    const subMsg = {
      type: 'subscribe',
      product_ids: ['BTC-USD'],
      channels: ['ticker'],
    };
    ws.send(JSON.stringify(subMsg));
  });

  ws.on('close', function close() {
    console.log('disconnected');
  });

  ws.on('message', function incoming(data) {
    data = JSON.parse(data)
    console.log(`Coinbase WS Response: ${data.price}`);

    const response = new exchange.CryptoResponse();
    response.setCurrent(data.price);

    // setup streaming
    call.write(response);
  });
}

server.addService(exchangeService.CryptoExchangeService, {
  subscribe,
});

server.bindAsync(SERVER_PATH, grpc.ServerCredentials.createInsecure(), () => {
  server.start();
  console.log(`Server running on ${SERVER_PATH}`);
});
