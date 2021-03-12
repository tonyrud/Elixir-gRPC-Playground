defmodule Calculator.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)
  run(Calculator.Server)
end

defmodule Calculator.Server do
  use GRPC.Server, service: Calculator.Service

  def add(%{num1: num1, num2: num2} = _params, _stream) do
    result = num1 + num2

    IO.inspect(result, label: "RESULT!")

    CalculatorReply.new(result: result)
  end

  # def get(request, _stream) do

  #   if user == nil do
  #     raise GRPC.RPCError, status: :not_found
  #   else
  #     Calculator.CalculatorReply.new(user)
  #   end
  # end
end
