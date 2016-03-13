## Using tail call optimization
# simply ensure that the last call
# in the function is the function.
# Hawever you may need to accumulate the result
defmodule Recursion3 do
  def ten_times(n), do: ten_times(n, 0)
  def ten_times(0, acc), do: acc
  def ten_times(n, acc) do
    # tail optimized
    ten_times(n - 1, acc + 10)
  end
end
IO.puts Recursion3.ten_times(3, 0)
