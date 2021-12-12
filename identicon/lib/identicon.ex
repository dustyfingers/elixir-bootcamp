defmodule Identicon do
  @moduledoc """
    This module takes in a string and outputs a 5x5 grid image to be used as a default profile picture
  """

  @doc """
    main function of module. takes in a string and spits out an image

  ## Examples

      iex> Identicon.main()
      :world

  """
  def main(input) do
    input
    |> hash_input
  end

  @doc """
    takes in a string and returns a list of the binary of the hash

  ## Examples

      iex> Identicon.hash_input()
      :world

  """
  def hash_input(input) do
    :crypto.hash(:md4, input)
    |> :binary.bin_to_list
  end

end
