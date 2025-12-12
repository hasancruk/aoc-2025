defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  import Day02

  test "length of an integer" do
    assert integer_length(123123) == 6
    assert integer_length(1) == 1
    assert integer_length(123413241324) == 12
  end
end
