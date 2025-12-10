defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  def read_file_to_list(name) do
    {:ok, content} = File.read(name)

    content
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(fn str -> String.length(str) != 0 end)
  end

  @doc """
  Count every time the dial passes through and lands on zero

  ## Examples

    iex > Day01.count_all_zeros(["L4", "R10"], 3, 0, 99)
    2
  """
  def count_all_zeros(moves, start, marker \\ 0, min \\ 0, max \\ 99) do
    {_, zero_count} = moves
    |> parse_moves()
    |> Enum.reduce({start, 0}, fn step, {p, count} ->
      {new_position, c} = instrumented_move(p, step, marker, min, max)
      {new_position, count + c}
    end)

    zero_count
  end

  @doc """
  Count every time the dial lands on zero

  ## Examples

    iex > Day01.count_zeros(["L3", "R3"], 3, 0, 99)
    1
  """
  def count_zeros(moves, start, marker \\ 0, min \\ 0, max \\ 99) do
    {_, zero_count} = moves
    |> parse_moves()
    |> Enum.reduce({start, 0}, fn step, {p, count} ->
      {
        move(p, step, min, max),
        if p == marker do count+1 else count end
      }
    end)

    zero_count
  end

  @doc """
  Parses moves from string syntax to numeric representation

  ## Examples

      iex> Day01.parse_moves(["L2", "R3"])
      [-2, 3]

  """
  def parse_moves(moves) do
    moves
    |> Enum.map(&parse_move/1)
  end

  defp parse_move("L" <> num) do
    String.to_integer(num) * -1
  end

  defp parse_move("R" <> num) do
    String.to_integer(num)
  end

  @doc """
  Move one step from a starting position counting the number of times it crosses a marker

  ## Examples

      iex> Day01.instrumented_move(50, -250)
      {0, 3}

      iex> Day01.instrumented_move(10, -15)
      {95, 1}

  """
  def instrumented_move(start, step, marker \\ 0, min \\ 0, max \\ 99) do
    final = start+step
    |> dial(min, max)

    direction =
      if step < 0 do
        :left
      else
        :right
      end

    m = (max - min) + 1
    r = abs(step) - distance_to_marker(direction, start, marker, min, max)
    count = cond do
      abs(step) > r -> 1 + floor(r/m)
      abs(step) == r -> floor(r/m)
      abs(step) < r -> 0
    end

    {final, count}
  end

  @doc """
  Measure the distance from starting point to marker depending on the direction of measurement. If thought of as a circle, right is clockwise and left is counter-clockwise.

  ## Examples

      iex> Day01.distance_to_marker(:left, 95, 96, 0, 99)
      99

      iex> Day01.distance_to_marker(:right, 95, 96, 0, 99)
      1

      iex> Day01.distance_to_marker(:right, 0, 0, -1, 1)
      0

  """
  def distance_to_marker(direction, start, marker \\ 0, min \\ 0, max \\ 99)

  def distance_to_marker(:left, start, marker, min, max) when marker > start do
    to_min = min - start
    to_marker = marker - max

    abs(to_min) + abs(to_marker) + 1
  end

  def distance_to_marker(:left, start, marker, _, _) when marker < start do
    abs(marker - start)
  end

  def distance_to_marker(:right, start, marker, _, _) when marker > start do
    abs(marker - start)
  end

  def distance_to_marker(:right, start, marker, min, max) when marker < start do
    to_max = max - start
    to_marker = marker - min

    to_max + to_marker + 1
  end

  def distance_to_marker(_, start, marker, _, _) when marker == start, do: 0

  @doc """
  Move one step from a starting position

  ## Examples

      iex> Day01.move(50, -10)
      40

  """
  def move(start, step, min \\ 0, max \\ 99) do
    start+step
    |> dial(min, max)
  end

  @doc """
  Dial is a circular function that will tell you the current number based on the input that is within the min and max range.

  ## Examples

      iex> Day01.dial(12, 0, 99)
      12

  """
  def dial(n, min, max) when n > max do
    diff = n-1-max
    dial(min+diff, min, max)
  end

  def dial(n, min, max) when n < min do
    diff = abs(min-n) - 1
    dial(max-diff, min, max)
  end

  def dial(n, _, _), do: n
end
