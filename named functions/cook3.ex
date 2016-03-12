defmodule Cook3 do
  def cook,             do: cook("fry", "sausage")
  def cook(0),          do: cook("bake", "banana")
  def cook(meat),       do: cook("grill", meat)
  def cook(type, food), do: "#{type} #{food}"
end
IO.inspect Cook3.cook
IO.inspect Cook3.cook 0
IO.inspect Cook3.cook "Turkey"
IO.inspect Cook3.cook "bbq", "Turkey"
