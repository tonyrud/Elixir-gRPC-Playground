defmodule CryptoResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          current: float | :infinity | :negative_infinity | :nan
        }

  defstruct [:current]

  field :current, 1, type: :float
end

defmodule CryptoInput do
  @moduledoc false
  use Protobuf, syntax: :proto3
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule CryptoExchange.Service do
  @moduledoc false
  use GRPC.Service, name: "CryptoExchange"

  rpc :subscribe, CryptoInput, stream(CryptoResponse)
end

defmodule CryptoExchange.Stub do
  @moduledoc false
  use GRPC.Stub, service: CryptoExchange.Service
end
