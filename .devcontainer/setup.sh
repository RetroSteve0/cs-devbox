#!/bin/bash

# Define a log file path
LOG_FILE="/var/log/install_script.log"

# Function to execute commands and log errors
execute_command() {
    "$@" 2>> "$LOG_FILE"
}

# Clear previous log content
> "$LOG_FILE"

# Update system
execute_command sudo apt-get update -y
execute_command sudo apt-get upgrade -y

# Install expect
execute_command sudo apt-get install expect -y

# Run the unminimize command with automatic "yes" response
execute_command expect -c 'spawn sudo unminimize; expect "Continue? \[y/N\]"; send "y\r"; expect eof'

# Display the log file
echo "Log file: $LOG_FILE"
