defmodule Bitcoin.Key.Public do
  @moduledoc """
  Public key operations.
  """

  use Bitcoin.Common

  alias Bitcoin.Crypto
  alias Bitcoin.Base58Check

  @type t :: binary

  @doc """
  Convert public key into a Bitcoin address.

  Details can be found here: https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses
  """
  @spec to_address(t) :: binary
  def to_address(pk) do
    pk
    |> Crypto.sha256()
    |> Crypto.ripemd160()
    |> Binary.prepend(@address_prefix[:public])
    |> Base58Check.encode()
  end
end
