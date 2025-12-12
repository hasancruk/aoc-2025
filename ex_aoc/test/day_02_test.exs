defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  import Day02

  test "length of an integer" do
    assert integer_length(123123) == 6
    assert integer_length(1) == 1
    assert integer_length(123413241324) == 12
  end

  test "split integer in half" do
    assert integer_split(123123) == {123, 123}
    assert integer_split(123456) == {123, 456}
    assert integer_split(12345) == :unsplittable
  end
end
