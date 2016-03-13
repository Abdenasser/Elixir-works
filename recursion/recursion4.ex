## Recursion: Reduce & Map

## Reduce, takes multiple values and
#  tries to reduce them down to one value
#  Sum a list of numbers:
defmodule Recursion4 do
  def sum([], acc), do: acc
  def sum([head | tail], acc), do: sum(tail, acc + head)
end
IO.puts Recursion4.sum([1,2,3], 0)
