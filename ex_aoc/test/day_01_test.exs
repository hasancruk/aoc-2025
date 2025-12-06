defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  import Day01

  test "dial numbers" do
    assert dial(0, 99, 12) == 12
    assert dial(0, 99, 100) == 0
    assert dial(0, 99, 200) == 0
    assert dial(0, 99, -1) == 99
    assert dial(0, 99, -5) == 95
    assert dial(0, 99, -100) == 0
    assert dial(1, 5, 1) == 1
    assert dial(1, 5, 5) == 5
    assert dial(1, 5, 6) == 1
    assert dial(1, 5, 7) == 2
    assert dial(1, 5, 0) == 5
    assert dial(1, 5, -1) == 4
    assert dial(-10, 0, 1) == -10
    assert dial(-10, 0, -11) == 0
  end
end
