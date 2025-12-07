defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  import Day01
# Following these rotations would cause the dial to move as follows:

#     The dial starts by pointing at 50.
#     The dial is rotated L68 to point at 82.
#     The dial is rotated L30 to point at 52.
#     The dial is rotated R48 to point at 0.
#     The dial is rotated L5 to point at 95.
#     The dial is rotated R60 to point at 55.
#     The dial is rotated L55 to point at 0.
#     The dial is rotated L1 to point at 99.
#     The dial is rotated L99 to point at 0.
#     The dial is rotated R14 to point at 14.
#     The dial is rotated L82 to point at 32.

# Because the dial points at 0 a total of three times during this process, the password in this example is 3.
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

  # test "count zeros before moving to new positions" do
  #   moves = [
  #     "L68",
  #     "L30",
  #     "R48",
  #     "L5 ",
  #     "R60",
  #     "L55",
  #     "L1 ",
  #     "L99",
  #     "R14",
  #     "L82",
  #   ]
  # end

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
