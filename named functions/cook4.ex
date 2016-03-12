## Guard clauses
# guards are a limited subset of elixir
# expressions e.g. is_xxx, ==, etc.
defmodule Cook4 do
  def cook(food) when food == 0 do
    "Nothing cooking"
  end
  def cook(food) when is_integer(food), do: "food is a number #{food}?"
  def cook(food) when is_atom(food),    do: "food is atomic!"
  def cook(food) when is_binary(food),  do: cook("boil", food)
  def cook(type, food), do: "#{type} #{food}"
end
IO.inspect Cook4.cook(0)
IO.inspect Cook4.cook(9)
IO.inspect Cook4.cook(:chicken)
IO.inspect Cook4.cook("chicken")
