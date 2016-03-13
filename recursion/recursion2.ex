# Pattern matching, guards and multiple
# clauses all aid recursion
# - order is important
defmodule Recursion2 do
  def countdown(0), do: IO.puts "Blast off!"
  def countdown(n) when n == 2 do
    IO.puts "#{n}...ignite engines..."
    countdown(n- 1)
  end
  def countdown(n) when is_integer n do
    IO.puts n
    countdown(n - 1)
  end
  # is_binary needs brackets
  def countdown(str) when is_binary(str), do: IO.puts "C'mon...countdown is a number!"
end
#Recursion2.countdown(5)
Recursion2.countdown("ten")
