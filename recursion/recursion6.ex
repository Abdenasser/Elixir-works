## Rarely use recursion for manipulating lists
#  use Enum instead:
IO.puts Enum.reduce([1,2,3], 0, fn (x, acc) -> x + acc end)
IO.inspect Enum.map([1,2,3,4], fn(x) -> x * x end)
