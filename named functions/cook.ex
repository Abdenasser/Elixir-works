defmodule Cook do
  #multiline function
  def boil(food) do
    f = "Boil #{food}"
    String.upcase(f)
  end
  #singleline function
  def sausage, do: boil("sausage")
end
IO.inspect Cook.boil("steak")
IO.inspect Cook.sausage
