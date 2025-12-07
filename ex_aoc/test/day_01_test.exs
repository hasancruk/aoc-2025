defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  import Day01

  test "count zeros after moves" do
    start = 50
    moves = [
      "L68",
      "L30",
      "R48",
      "L5",
      "R60",
      "L55",
      "L1",
      "L99",
      "R14",
      "L82",
    ]
    assert count_zeros(moves, start, 0, 99) == 3
  end

  test "parse moves to signed numbers" do
    moves = [
      "L68",
      "L30",
      "R48",
      "L5",
      "R60",
      "L55",
      "L1",
      "L99",
      "R14",
      "L82",
    ]
    expected = [
      -68,
      -30,
      48,
      -5,
      60,
      -55,
      -1,
      -99,
      14,
      -82,
    ]

    assert parse_moves(moves) == expected
  end

  test "move from starting position to get new position" do
    min = 0
    max = 99
    assert move(11, 8, min, max) == 19
    assert move(19, -19, min, max) == 0

    assert move(5, -10, min, max) == 95
    assert move(95, 5, min, max) == 0
  end

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
