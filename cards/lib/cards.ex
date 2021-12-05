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
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # list comprehensions
    # a comprehension is a mapping function

    # BAD APPROACH IN ELIXIR
    # for suit <- suits do

    #   for value <- values do

    #     "#{value} of #{suit}"

    #   end

    # end

    # better way to do multiple comprehensions in elixir
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  # shuffle method takes a 'deck' as an argument
  # elixir forces you to call methods with the correct number of arguments
  def shuffle(deck) do 
    # Enum is part of the elixir standard library
    # this does NOT mutate the 'deck' variable - it returns a new list
    Enum.shuffle(deck)
  end

  # ? is valid in method names in elixir
  # doesnt impart any special funcitonality
  # mainly used to denote that the method returns 'truthy' or 'falsey'
  # rule of thumb - used when 'asking a question' about a certain data structure
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

end
