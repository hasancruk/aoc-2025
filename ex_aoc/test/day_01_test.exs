defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  import Day01

  test "current position on the dial" do
    assert dial(12, 0, 99) == 12
    assert dial(100, 0, 99) == 0
    assert dial(200, 0, 99) == 0
    assert dial(-1, 0, 99) == 99
    assert dial(-5, 0, 99) == 95
    assert dial(-100, 0, 99) == 0
    assert dial(1, 1, 5) == 1
    assert dial(5, 1, 5) == 5
    assert dial(6, 1, 5) == 1
    assert dial(7, 1, 5) == 2
    assert dial(0, 1, 5) == 5
    assert dial(-1, 1, 5) == 4
    assert dial(1, -10, 0) == -10
    assert dial(-11, -10, 0) == 0
  end
end
