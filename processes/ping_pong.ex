## Process PingPong
## process 1 will send a ping message to process 2
## process 2 will respond with a pong message to process 1
## do this 11 times

# 1. Player_1 --PING--> Player_2
# 2. Player_1 <-PONG--- Player_2
# 3. Player_1 --PING--> Player_2
# ..
# ..
# 10. Player_1 <-PONG--- Player_2
# 11. Player_2 --PING--> Player_2


# Create PingPong module
defmodule PingPong do
  @game_finish 11
  def ready do
    receive do
      {_sender, _action, @game_finish} ->
        IO.puts "Game finished..."
        ready
      {sender, action, turn} ->
        hit_to(sender, switch(action), turn + 1)
        ready
      after
        1_000 -> IO.puts "timing out player #{inspect player_pid}"
    end
  end
  def hit_to(opponent_id, action, turn) do
    IO.puts "#{turn}. hit_to #{inspect opponent_id} #{inspect action}"
    send(opponent_id, {player_pid, action, turn})
  end

  defp switch(action) do
    case action do
      :ping -> :pong
      _____ -> :ping
    end
  end

  defp player_pid, do: self
end
# Ready function to receive messages from other processes
# Handle each message
# Send message to process
# Switch between ping/pong


# 1. get main process PID
player_1 = self
# 2. get spawned process PID
#player_2 = spawn(PingPong, :ready, [])
#player_2 = elem(Task.start(PingPong, :ready,[]), 1)
player_2 = PingPong |> Task.start(:ready,[]) |> elem(1)
# 3. inspect PID values
IO.puts "player_1: #{inspect player_1}"
IO.puts "player_2: #{inspect player_2}"
# 4. send message from main process to spawned process
PingPong.hit_to(player_2, :ping, 1)
# 5. start message receiver an main process
PingPong.ready
