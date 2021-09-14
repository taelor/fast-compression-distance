defmodule FastCompressionDistance do
  alias FastCompressionDistance.LZW

  def compare(subject, target), do: run_compression_and_comparison(subject, target)

  defp run_compression_and_comparison(subject, target) do
    {_, subject_table} = LZW.encode(subject)
    {_, target_table} = LZW.encode(target)

    subject_keys = Map.keys(subject_table)
    target_keys = Map.keys(target_table)

    subject_key_count = Enum.count(subject_keys)
    intersection_key_count = Enum.count(intersection(subject_keys, target_keys))

    result = 1 - (subject_key_count - intersection_key_count) / subject_key_count

    metadata = %{
      subject_key_count: subject_key_count,
      intersection_key_count: intersection_key_count
    }

    {:ok, {result, metadata}}
  end

  defp intersection(subject_keys, target_keys) do
    MapSet.intersection(
      Enum.into(subject_keys, MapSet.new()),
      Enum.into(target_keys, MapSet.new())
    )
    |> MapSet.to_list()
  end
end
