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
    |> pick_color
  end

  @doc """
    takes in a string and returns a list of the binary of the hash of that string

  ## Examples

      iex> Identicon.hash_input()
      :world

  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  @doc """
    takes in an image struct and picks an rgb color from it

  ## Examples

      iex> Identicon.pick_color()
      :world

  """
  def pick_color(image) do
    # no array accessor eg [0] in elixir - use pattern matching
    # _tail is the rest of the list
    %Identicon.Image{hex: [red, green, blue | _tail]} = image
    [red, green, blue]
  end

end
 