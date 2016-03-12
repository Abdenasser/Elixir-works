## Functions can be public or private
defmodule Cook2 do
  # public function
  def cook(meat, veg), do: _cook("Grill", meat) <> _cook("boil", veg)
  # private function
  defp _cook(cook, food) do
    "#{cook} #{food} "
  end
end
IO.inspect Cook2.cook "pasta", "bacon"
IO.inspect Cook2._cook "pasta", "bacon"
