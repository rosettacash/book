defmodule Bitcoin.Crypto do
  @moduledoc """
  Currently just wrappers around erlang's :crypto for easy piping.
  """

  @spec ripemd160(
          binary()
          | maybe_improper_list(
              binary() | maybe_improper_list(any(), binary() | []) | byte(),
              binary() | []
            )
        ) :: binary()
  def ripemd160(bin), do: :crypto.hash(:ripemd160, bin)

  @spec sha1(
          binary()
          | maybe_improper_list(
              binary() | maybe_improper_list(any(), binary() | []) | byte(),
              binary() | []
            )
        ) :: binary()
  def sha1(bin), do: :crypto.hash(:sha, bin)

  @spec sha256(
          binary()
          | maybe_improper_list(
              binary() | maybe_improper_list(any(), binary() | []) | byte(),
              binary() | []
            )
        ) :: binary()
  def sha256(bin), do: :crypto.hash(:sha256, bin)
end
