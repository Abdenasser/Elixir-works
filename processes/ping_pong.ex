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
# Ready function to receive messages from other processes
# Handle each message
# Send message to process
# Switch between ping/pong
