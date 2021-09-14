defmodule FastCompressionDistance.LZWTest do
  use ExUnit.Case
  alias FastCompressionDistance.LZW

  test "TOBEORNOTTOBEORTOBEORNOT" do
    {compressed, table} = LZW.encode("TOBEORNOTTOBEORTOBEORNOT")

    assert compressed == [84, 79, 66, 69, 79, 82, 78, 79, 84, 256, 258, 260, 265, 259, 261, 263]

    assert %{
             'TO' => 256,
             'OB' => 257,
             'BE' => 258,
             'EO' => 259,
             'OR' => 260,
             'RN' => 261,
             'NO' => 262,
             'OT' => 263,
             'TT' => 264,
             'TOB' => 265,
             'BEO' => 266,
             'ORT' => 267,
             'TOBE' => 268,
             'EOR' => 269,
             'RNO' => 270
           } = table
  end
end
