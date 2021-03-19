// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('@grpc/grpc-js');
var crypto_exchange_pb = require('./crypto_exchange_pb.js');

function serialize_CryptoInput(arg) {
  if (!(arg instanceof crypto_exchange_pb.CryptoInput)) {
    throw new Error('Expected argument of type CryptoInput');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_CryptoInput(buffer_arg) {
  return crypto_exchange_pb.CryptoInput.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_CryptoResponse(arg) {
  if (!(arg instanceof crypto_exchange_pb.CryptoResponse)) {
    throw new Error('Expected argument of type CryptoResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_CryptoResponse(buffer_arg) {
  return crypto_exchange_pb.CryptoResponse.deserializeBinary(new Uint8Array(buffer_arg));
}


var CryptoExchangeService = exports.CryptoExchangeService = {
  subscribe: {
    path: '/CryptoExchange/subscribe',
    requestStream: false,
    responseStream: true,
    requestType: crypto_exchange_pb.CryptoInput,
    responseType: crypto_exchange_pb.CryptoResponse,
    requestSerialize: serialize_CryptoInput,
    requestDeserialize: deserialize_CryptoInput,
    responseSerialize: serialize_CryptoResponse,
    responseDeserialize: deserialize_CryptoResponse,
  },
};

exports.CryptoExchangeClient = grpc.makeGenericClientConstructor(CryptoExchangeService);
