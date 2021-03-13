// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('@grpc/grpc-js');
var calculator_pb = require('./calculator_pb.js');

function serialize_CalculatorParams(arg) {
  if (!(arg instanceof calculator_pb.CalculatorParams)) {
    throw new Error('Expected argument of type CalculatorParams');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_CalculatorParams(buffer_arg) {
  return calculator_pb.CalculatorParams.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_CalculatorReply(arg) {
  if (!(arg instanceof calculator_pb.CalculatorReply)) {
    throw new Error('Expected argument of type CalculatorReply');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_CalculatorReply(buffer_arg) {
  return calculator_pb.CalculatorReply.deserializeBinary(new Uint8Array(buffer_arg));
}


var CalculatorService = exports.CalculatorService = {
  sum: {
    path: '/Calculator/sum',
    requestStream: false,
    responseStream: false,
    requestType: calculator_pb.CalculatorParams,
    responseType: calculator_pb.CalculatorReply,
    requestSerialize: serialize_CalculatorParams,
    requestDeserialize: deserialize_CalculatorParams,
    responseSerialize: serialize_CalculatorReply,
    responseDeserialize: deserialize_CalculatorReply,
  },
  subtract: {
    path: '/Calculator/subtract',
    requestStream: false,
    responseStream: false,
    requestType: calculator_pb.CalculatorParams,
    responseType: calculator_pb.CalculatorReply,
    requestSerialize: serialize_CalculatorParams,
    requestDeserialize: deserialize_CalculatorParams,
    responseSerialize: serialize_CalculatorReply,
    responseDeserialize: deserialize_CalculatorReply,
  },
};

exports.CalculatorClient = grpc.makeGenericClientConstructor(CalculatorService);
