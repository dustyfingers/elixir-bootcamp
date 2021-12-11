# defmodule creates a 
# module is a collection of methods or functions
defmodule Cards do
  @moduledoc """
    provides methods for creating andd handling a deck of cards
  """

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

  def deal(deck, hand_size) do

    # returns a tuple, denoted by {} in elixir
    # order of items matters in tuples!
    # index 0 is always hand, index 1 is always rest of deck
    Enum.split(deck, hand_size)

    # pattern matching is elixirs replacement for variable assignment!
    # color1 = ["red"] # --> ["red"]
    # [color1] = ["red"] # --> "red"

  end

  def save(deck, filename) do 

    # hook into erlang to convert deck to a binary (binaries can be written to the file system)
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)

  end

  def load(filename) do

    # ! IF STATEMENTS ARE GENERALLY BAD FORM IN ELIXIR
    # ! USE CASE INSTEAD
    case File.read(filename) do

      # the pattern :word in elixir is called an 'atom'. they are often used to represent status codes
      # the two most common are :ok and :error
      { :ok, file_bin } -> :erlang.binary_to_term(file_bin)
      { :error, _reason } -> :"File not found."

    end

  end

  def create_hand(hand_size) do

    # without pipe operator
    # deck = Cards.create_deck()

    # deck = Cards.shuffle(deck)

    # hand = Cards.deal(deck, hand_size)

    # same as above but with pipe operator
    # consistent first arguments are CRUCIAL when using the pipe operator
    Cards.create_deck

    |> Cards.shuffle

    # 'deck' is implicitly passed into .deal() as the first argument - due to the pipe operator=
    |> Cards.deal(hand_size)

  end

end
