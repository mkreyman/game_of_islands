defmodule IslandsEngine.Coordinate do
  alias __MODULE__

  @enforce_keys [:col, :row]
  @board_range 1..10

  # In case I later decide to use letters for column names:
  # @column_range Enum.map(?a..?j, fn(x) -> <<x :: utf8>> end)
  # @row_range 1..10

  defstruct [:col, :row]

  def new(col, row) when col in(@board_range) and row in(@board_range), do:
    {:ok, %Coordinate{col: col, row: row}}

  def new(_col, _row), do: {:error, :invalid_coordinate}
end