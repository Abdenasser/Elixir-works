defmodule Pascal do
  def add_row(initial) do
    add_row(initial, 0, [])
  end

  def add_row([], 0, final) do
    [0 | final]
  end

  def add_row([h | t], last, new) do
    add_row(t, h, [last + h | new])
  end
end

# iex(5)> c"pascal.ex"
# [Pascal]
# iex(6)> import Pascal
# nil
# iex(7)> add_row([0,1,0])
# [0, 1, 1, 0]
# iex(8)> add_row([0, 1, 1, 0])
# [0, 1, 2, 1, 0]
# iex(9)> add_row([0, 1, 2, 1, 0])
# [0, 1, 3, 3, 1, 0]
