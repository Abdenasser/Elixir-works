## Map
# Traverse a list applying a mapping
#defmodule Recursion5 do
#  def square([]), do: []
#  #not tail call optimized
#  def square([head | tail]), do: [head * head | square(tail)]
#end
#IO.inspect Recursion5.square([1,2,3,4])


## Tail optimized map
defmodule Recursion5 do
  def square([], acc), do: acc
  def square([head | tail], acc), do: square(tail, acc ++ [head * head])
end
IO.inspect Recursion5.square([1,2,3,4], [])
