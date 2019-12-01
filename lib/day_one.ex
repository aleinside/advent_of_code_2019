defmodule DayOne do
  @doc """
  ## Examples

      iex> #{__MODULE__}.calculate_fuel(12)
      2

      iex> #{__MODULE__}.calculate_fuel(14)
      2

      iex> #{__MODULE__}.calculate_fuel(1969)
      654

      iex> #{__MODULE__}.calculate_fuel(100756)
      33583
  """
  def calculate_fuel(mass) do
    mass
    |> Integer.floor_div(3)
    |> Kernel.-(2)
  end

  @doc """
  ## Examples

    iex> #{__MODULE__}.calculate_fuel_and_extra(14)
    2

    iex> #{__MODULE__}.calculate_fuel_and_extra(1969)
    966

    iex> #{__MODULE__}.calculate_fuel_and_extra(100756)
    50346

    iex> #{__MODULE__}.calculate_fuel_and_extra(145963)
    72949

    iex> #{__MODULE__}.calculate_fuel_and_extra(119152)
    59545

    iex> #{__MODULE__}.calculate_fuel_and_extra(122543)
    61239
  """
  def calculate_fuel_and_extra(mass, acc \\ 0) do
    mass
    |> Integer.floor_div(3)
    |> extra_fuel(acc)
  end

  def extra_fuel(n, acc) when n >= 3 do
    new_fuel = n - 2
    calculate_fuel_and_extra(new_fuel, acc + new_fuel)
  end
  def extra_fuel(_n, acc), do: acc

  def just_do_it() do
    'input-day-1.txt'
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&calculate_fuel/1)
    |> Enum.sum()
  end

  def just_do_it_with_extra() do
    'input-day-1.txt'
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&calculate_fuel_and_extra/1)
    |> Enum.sum()
  end

end
