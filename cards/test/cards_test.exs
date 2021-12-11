defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  # basic tests
  # test "greets the world" do
  #   assert Cards.hello_world() == "hi there!"
  # end

  # test "the truth" do
  #   assert 1 + 1 == 2
  # end

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle(deck)
    # you could also do 'refute deck == Cards.shuffle(deck)'
  end

end
    