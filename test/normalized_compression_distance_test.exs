defmodule NormalizedCompressionDistanceTest do
  use ExUnit.Case
  doctest NormalizedCompressionDistance

  test "compare the exact same string" do
    subject =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam rhoncus mauris ultricies congue porttitor. Vestibulum rhoncus eros velit, vel placerat lectus rutrum et. Nam eget ante arcu. In nec tincidunt ex, pharetra mollis tortor. Nulla facilisi. Pellentesque tempus vitae lacus non lobortis. Cras sed ipsum dignissim, tempor nulla nec, lobortis ex. Quisque vel vehicula libero. Mauris sed ante enim. Nam ornare enim nibh, vel elementum nisi dignissim sed. Maecenas sed ante nec mi interdum consectetur. Quisque imperdiet vulputate facilisis. Vestibulum facilisis iaculis diam. Pellentesque molestie quam arcu, nec consectetur orci fermentum vitae. Duis accumsan, leo vitae blandit dignissim, dui libero egestas odio, et consequat est nisl sit amet lacus. Aliquam at pharetra nisi, a pulvinar arcu."

    target = subject

    {:ok, {result, _metatata}} = NormalizedCompressionDistance.compare(subject, target)

    assert result == 0.962962962962963
  end

  test "compare different strings" do
    subject =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin purus tellus, pharetra ac egestas eleifend, condimentum vulputate lorem. Proin in cursus mauris. Duis feugiat dui ut risus faucibus finibus id varius est. Pellentesque varius semper nisi. Curabitur faucibus scelerisque lacus id viverra. Aliquam erat volutpat. Nullam rhoncus accumsan augue, at malesuada magna faucibus ut. Suspendisse justo ex, tincidunt vitae viverra eu, hendrerit eget nisi. Aliquam aliquam dictum felis, vel placerat dui commodo et."

    target =
      "Morbi ultrices dolor sem, in vulputate neque lobortis nec. Quisque eleifend suscipit velit at placerat. Sed pharetra diam ullamcorper nibh sodales, eu iaculis arcu mollis. Vivamus commodo nulla ac eros euismod, quis cursus sem congue. Donec viverra sem id lacus dictum, ut cursus lectus condimentum. Quisque eu vulputate ante. Vivamus posuere, eros aliquam sagittis euismod, risus augue tincidunt mi, sit amet congue massa nisl a odio. Nullam facilisis odio commodo tortor ultrices, finibus facilisis magna ullamcorper. Aliquam erat volutpat. Duis auctor pharetra metus et dignissim. Mauris sed lacus vel dolor maximus tincidunt. Aenean semper quam id dapibus efficitur. Donec commodo gravida ultrices. Etiam vulputate commodo lectus eget dapibus. In pellentesque et dui id cursus. Pellentesque condimentum est libero, in rutrum arcu laoreet quis."

    {:ok, {result, _metatata}} = NormalizedCompressionDistance.compare(subject, target)

    assert result == 0.24726477024070026
  end
end
