defmodule NormalizedCompressionDistance do
  def compare(subject, target) do
    compressed_pair = [
      bit_size(:zlib.gzip(subject)),
      bit_size(:zlib.gzip(target))
    ]

    compressed_combined = bit_size(:zlib.gzip(subject <> target))

    compressed_pair_minimum = Enum.min(compressed_pair)

    compressed_pair_maximim = Enum.max(compressed_pair)

    result = 1 - (compressed_combined - compressed_pair_minimum) / compressed_pair_maximim

    metadata = %{
      compressed_combined: compressed_combined,
      compressed_pair_minimum: compressed_pair_minimum,
      compressed_pair_maximim: compressed_pair_maximim
    }

    {:ok, {result, metadata}}
  end
end
