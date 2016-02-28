defmodule ListDrop do
  def falls(list) do
    falls(list, [])
  end

  def falls([], results) do
    results
  end

  def falls([head | tail], results) do
    falls(tail, [Drop1.fall_velocity(head) | results])
  end
end
