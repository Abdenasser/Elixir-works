## Compiler warns of overlapping functions
defmodule Cook6 do
  def cook(food, type \\"boiled", veg \\"beans")
  def cook(food, type), do: "overlapping function"
  def cook(food, type, veg), do: "Grilled #{food} with #{type} #{veg}"
end

IO.puts Cook6.cook "chicken"
