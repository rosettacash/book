defmodule Bitcoin.Protocol.Types.TxOutput do
  alias Bitcoin.Protocol.Types.VarString

  # Transaction Value (in satoshis)
  defstruct value: 0,
            # Usually contains the public key as a Bitcoin script setting up conditions to claim this output.
            pk_script: <<>>

  @type t :: %__MODULE__{
          value: non_neg_integer,
          pk_script: binary
        }

  defimpl Inspect, for: __MODULE__ do
    @spec inspect(atom() | %{pk_script: binary(), value: any()}, any()) :: <<_::64, _::_*8>>
    def inspect(data, _opts) do
      "%Out{ #{data.value} -> #{data.pk_script |> Base.encode16()} }"
    end
  end

  @spec parse_stream(binary) :: {t, binary}
  def parse_stream(payload) do
    <<value::unsigned-little-integer-size(64), payload::binary>> = payload
    {pk_script, payload} = VarString.parse_stream(payload)

    {%__MODULE__{
       value: value,
       pk_script: pk_script
     }, payload}
  end

  @spec serialize(t) :: binary
  def serialize(%__MODULE__{} = s) do
    <<s.value::unsigned-little-integer-size(64)>> <> (s.pk_script |> VarString.serialize())
  end
end
