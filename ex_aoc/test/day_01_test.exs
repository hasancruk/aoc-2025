defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  import Day01

  test "count zeros during and after moves" do
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
    assert count_all_zeros(moves, start, 0, 0, 99) == 6
  end

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
    assert count_zeros(moves, start, 0, 0, 99) == 3
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

  test "instrumented move from starting position to get new position" do
    assert instrumented_move(17, 2, 0, 0, 99) == {19, 0}

    assert instrumented_move(-1, 8, 0, -1, 1) == {1, 3}
    assert instrumented_move(0, 3, 0, -1, 1) == {0, 1}
    assert instrumented_move(0, 8, 0, -1, 1) == {-1, 2}
    assert instrumented_move(0, 9, 0, -1, 1) == {0, 3}
  end

  test "distance to marker" do
    assert distance_to_marker(:right, -1, 0, -1, 1) == 1
    assert distance_to_marker(:right, 0, 0, -1, 1) == 0
    assert distance_to_marker(:right, 1, 0, -1, 1) == 2
    assert distance_to_marker(:left, 0, 0, -1, 1) == 0
    assert distance_to_marker(:left, 1, 0, -1, 1) == 1
    assert distance_to_marker(:left, -1, 0, -1, 1) == 2

    assert distance_to_marker(:right, 95, 0, 0, 99) == 5
    assert distance_to_marker(:right, 95, 5, 0, 99) == 10
    assert distance_to_marker(:left, 5, 0, 0, 99) == 5
    assert distance_to_marker(:left, 95, 96, 0, 99) == 99
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
