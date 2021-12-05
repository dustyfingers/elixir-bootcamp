# defmodule creates a 
# module is a collection of methods or functions
defmodule Cards do

  # def defines a method in this module
  def hello_world do
    # implicit return last value in function
    "hi there!"
  end

  def create_deck do
    # brackets define a list
    ["Ace", "Two", "Three"]
  end

  # shuffle method takes a 'deck' as an argument
  # elixir forces you to call methods with the correct number of arguments
  def shuffle(deck) do 
    # Enum is part of the elixir standard library
    Enum.shuffle(deck)
  end

end
