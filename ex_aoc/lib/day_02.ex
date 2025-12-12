defmodule Day02 do
  @moduledoc """
  Documentation for `Day02`.
  """

  def read_file_to_list(name) do
    {:unimplemented, name}
  end

  @doc """
  Count every time the dial passes through and lands on zero

  ## Examples

    iex > Day02.integer_length(12341324)
    8
  """
  def integer_length(int) do
    n = int
    |> abs()
    |> :math.log10()
    |> floor()
    |> trunc()
    1 + n
  end
end
