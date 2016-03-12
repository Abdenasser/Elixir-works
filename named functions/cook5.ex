## Functions can have default arguments
defmodule Cook5 do
  def cook(type \\"grill", food), do: "#{type} #{food}"
  def cook(food, type, veg), do: "Tasty #{food} with #{type} #{veg}"
end
IO.inspect Cook5.cook("cake")
IO.inspect Cook5.cook("boil","cake")
IO.inspect Cook5.cook "brussels sprouts", "fried", "pineapple"
