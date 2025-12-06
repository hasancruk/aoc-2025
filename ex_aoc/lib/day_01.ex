defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  @doc """
  Dial is a circular function that will tell you the current number based on the input that is within the min and max range.

  ## Examples

      iex> Day01.dial(0, 99, 12)
      12

  """
  def dial(min, max, n) when n > max do
    diff = n-1-max
    dial(min, max, min+diff)
  end

  def dial(min, max, n) when n < min do
    diff = abs(min-n) - 1
    dial(min, max, max-diff)
  end

  def dial(_, _, n), do: n
end
