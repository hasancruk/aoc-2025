defmodule Day02 do
  @moduledoc """
  Documentation for `Day02`.
  """
require Integer

  def read_file_to_list(name) do
    {:unimplemented, name}
  end

  @doc """
  Returns the length of an integer

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

  @doc """
  Splits an even length integer in two

  ## Examples

    iex > Day02.integer_split(12341324)
    {1234, 1234}

  """
  def integer_split(int) do
    length = integer_length(int)

    if Integer.is_even(length) do
      power = :math.pow(10, trunc(length / 2))
      decimal_form = int / power
      a = decimal_form
      |> floor()
      |> trunc()

      b = (decimal_form - a) * power
      |> floor()
      |> trunc()

      {a, b}
    else
      :unsplittable
    end
  end
  # def integer_split(int) when Integer.is_even(integer_length(int)), do: :unsplittable
end
