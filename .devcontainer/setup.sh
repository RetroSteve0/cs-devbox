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

# Display the log file
echo "Log file: $LOG_FILE"
