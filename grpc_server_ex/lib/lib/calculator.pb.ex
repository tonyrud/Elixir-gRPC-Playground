defmodule SampleApp.CalculatorReply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: integer
        }

  defstruct [:result]

  field :result, 1, type: :int32
end

defmodule SampleApp.CalcRequest do
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

defmodule SampleApp.Calculator.Service do
  @moduledoc false
  use GRPC.Service, name: "sample_app.Calculator"

  rpc :add, SampleApp.CalcRequest, SampleApp.CalculatorReply
end

defmodule SampleApp.Calculator.Stub do
  @moduledoc false
  use GRPC.Stub, service: SampleApp.Calculator.Service
end
