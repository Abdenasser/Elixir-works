## Control Flow
`Elixir code tries to be declarative, not imperative.`<br><br>
Elixir does have a small set of control-flow constructs, but most of Elixir developers advice that you should consider more functional alternatives before you think to use them.
### if/unless
In Elixir, if and its evil twin, unless , take two parameters: a condition and a
keyword list, which can contain the keys do: and else: . If the condition is truthy,
the if expression evaluates the code associated with the do: key; otherwise it
evaluates the else: code.

```elixir
if :something_truthy do
  IO.puts "something truthy happened"
else
  IO.puts "false or nil happened"
end

unless :something_truthy do
  IO.puts "nil or false happened"
else
 IO.puts "something truthy happened"
end
```

### case
`case` lets you test a value against a set of patterns, executes the code associated
with the first one that matches, and returns the value of that code..<br>
If no cases match it throws a `MatchError`.
```elixir
case 137 do
  "137" -> IO.puts "I require 137 the number."
  137   -> IO.puts "Ahh much better."
  138   ->
    IO.puts "Blocks can start on the next line as well."
end
```

Like all pattern matches, `_` will match anything and can be used as a catchall:
```elixir
case {:ok, "everything went to plan"} do
  {:ok, message}    -> IO.puts message
  {:error, message} -> IO.puts "ERROR!: #{message}"
# ⇣catchall, otherwise you'll get an error if nothing matches
  _                 -> IO.puts "I match everything else!"
end
```

You can have [guards](#guards) on your cases:
```elixir
case 1_349 do
  n when is_integer n -> IO.puts "you gave me an integer"
  n when is_binary n  -> IO.puts "you gave me a binary"
  _                   -> IO.puts "you gave me neither an integer nor binary"
end
```

### cond
`cond` takes one or more conditions and runs the first truthy one it finds.<br>
Often used where imperative languages would use elseif.<br>
If no statements evaluate to true it throws a `MatchError`.
```elixir
cond do
  false -> IO.puts "I will never run"
  true  -> IO.puts "I will always run"
  1235  -> IO.puts "I would run if that dang true wasn't on top of me."
end
```

`true` is often used as a catch all:
```elixir
guess = 12
cond do
  guess == 10 -> IO.puts "You guessed 10!"
  guess == 46 -> IO.puts "You guessed 46!"
  true        ->
    IO.puts "I give up."
end
```
### do/end blocks

At this point, we have learned four control structures: case, cond, if and unless, and they were all wrapped in do/end blocks. It happens we could also write if as follows:

```elixir
iex> if true, do: 1 + 2
3
```

Notice how the example above has a comma between true and do:, that’s because it is using Elixir’s regular syntax where each argument is separated by comma. We say this syntax is using keyword lists. We can pass else using keywords too:

```elixir
iex> if false, do: :this, else: :that
:that
```

do/end blocks are a syntactic convenience built on top of the keywords one. That’s why do/end blocks do not require a comma between the previous argument and the block. They are useful exactly because they remove the verbosity when writing blocks of code. These are equivalent:

```elixir
iex> if true do
...>   a = 1 + 2
...>   a + 10
...> end
13
```
```elixir
iex> if true, do: (
...>   a = 1 + 2
...>   a + 10
...> )
13
```

One thing to keep in mind when using do/end blocks is they are always bound to the outermost function call. For example, the following expression:

```elixir
iex> is_number if true do
...>  1 + 2
...> end
** (RuntimeError) undefined function: if/1
```
Would be parsed as:
```elixir
iex> is_number(if true) do
...>  1 + 2
...> end
** (RuntimeError) undefined function: if/1
```

Which leads to an undefined function error as Elixir attempts to invoke if/1. Adding explicit parentheses is enough to resolve the ambiguity:

```elixir
iex> is_number(if true do
...>  1 + 2
...> end)
true
```

Keyword lists play an important role in the language and are quite common in many functions and macros.
