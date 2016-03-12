## Piping functions similar to unix pipe
# uses the '|>' operator

#String.reverse( String.upcase("trebor") )
IO.puts String.upcase("trebor") |> String.reverse
IO.puts "trebor"
  |> String.upcase
  |> String.reverse  
