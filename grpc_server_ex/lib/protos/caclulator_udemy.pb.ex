defmodule Calculator.SquareRootRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          number: integer
        }

  defstruct [:number]

  field :number, 1, type: :int32
end

defmodule Calculator.SquareRootResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          number_root: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:number_root]

  field :number_root, 1, type: :double
end

defmodule Calculator.FindMaximumRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          number: integer
        }

  defstruct [:number]

  field :number, 1, type: :int32
end

defmodule Calculator.FindMaximumResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          maximum: integer
        }

  defstruct [:maximum]

  field :maximum, 1, type: :int32
end

defmodule Calculator.ComputeAverageResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          average: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:average]

  field :average, 1, type: :double
end

defmodule Calculator.ComputeAverageRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          number: integer
        }

  defstruct [:number]

  field :number, 1, type: :int32
end

defmodule Calculator.PrimeNumberDecompositionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          number: integer
        }

  defstruct [:number]

  field :number, 1, type: :int32
end

defmodule Calculator.PrimeNumberDecompositionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          prime_factor: integer
        }

  defstruct [:prime_factor]

  field :prime_factor, 1, type: :int32
end

defmodule Calculator.SumRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          first_number: integer,
          second_number: integer
        }

  defstruct [:first_number, :second_number]

  field :first_number, 1, type: :int32
  field :second_number, 2, type: :int32
end

defmodule Calculator.SumResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sum_result: integer
        }

  defstruct [:sum_result]

  field :sum_result, 1, type: :int32
end

defmodule Calculator.CalculatorService.Service do
  @moduledoc false
  use GRPC.Service, name: "calculator.CalculatorService"

  rpc :Sum, Calculator.SumRequest, Calculator.SumResponse

  rpc :PrimeNumberDecomposition,
      Calculator.PrimeNumberDecompositionRequest,
      stream(Calculator.PrimeNumberDecompositionResponse)

  rpc :ComputeAverage, stream(Calculator.ComputeAverageRequest), Calculator.ComputeAverageResponse

  rpc :FindMaximum, stream(Calculator.FindMaximumRequest), stream(Calculator.FindMaximumResponse)

  rpc :SquareRoot, Calculator.SquareRootRequest, Calculator.SquareRootResponse
end

defmodule Calculator.CalculatorService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Calculator.CalculatorService.Service
end
