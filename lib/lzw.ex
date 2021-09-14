defmodule FastCompressionDistance.LZW do
  @starting_table Enum.reduce(0..255, %{}, &Map.put(&2, [&1], &1))

  def encode(string) do
    [current | remaining] = to_charlist(string)

    find_next([], @starting_table, remaining, [current], 256)
  end

  def find_next(compressed, table, [], _, _) do
    {
      Enum.reverse(compressed),
      Map.drop(table, Map.keys(@starting_table))
    }
  end

  def find_next(compressed, table, [next], current, _) do
    [table[current ++ [next]] | compressed]
    |> find_next(table, [], nil, nil)
  end

  def find_next(compressed, table, [next | remaining], current, next_table_value) do
    if table[current ++ [next]] do
      find_next(compressed, table, remaining, current ++ [next], next_table_value)
    else
      [table[current] | compressed]
      |> find_next(
        Map.put(table, current ++ [next], next_table_value),
        remaining,
        [next],
        next_table_value + 1
      )
    end
  end
end
