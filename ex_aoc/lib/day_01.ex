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
  Count every time the dial lands on zero

  ## Examples

    iex > Day01.count_zeros(["L3", "R3"], 3, 0, 99)
    1
  """
  def count_zeros(moves, start, min \\ 0, max \\ 99) do
    {_, zero_count} = moves
    |> parse_moves()
    |> Enum.reduce({start, 0}, fn step, {p, count} ->
      {
        move(p, step, min, max),
        if p == 0 do count+1 else count end
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
