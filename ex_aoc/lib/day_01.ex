defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

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
