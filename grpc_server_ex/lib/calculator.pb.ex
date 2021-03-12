defmodule CalculatorReply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: integer
        }

  defstruct [:result]

  field :result, 1, type: :int32
end

defmodule CalculatorParams do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          num1: integer,
          num2: integer
        }

  defstruct [:num1, :num2]

  field :num1, 1, type: :int32
  field :num2, 2, type: :int32
end

defmodule Calculator.Service do
  @moduledoc false
  use GRPC.Service, name: "Calculator"

  rpc :add, CalculatorParams, CalculatorReply

  rpc :subtract, CalculatorParams, CalculatorReply
end

defmodule Calculator.Stub do
  @moduledoc false
  use GRPC.Stub, service: Calculator.Service
end
