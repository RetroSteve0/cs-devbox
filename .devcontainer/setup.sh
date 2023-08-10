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

# Install NVM
execute_command sudo git clone https://github.com/nvm-sh/nvm.git /usr/local/nvm
execute_command sudo chown -R root:root /usr/local/nvm
execute_command echo 'export NVM_DIR="/usr/local/nvm"' | sudo tee -a /etc/bash.bashrc
execute_command echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' | sudo tee -a /etc/bash.bashrc
execute_command echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' | sudo tee -a /etc/bash.bashrc

# Reload shell configuration (for the current session)
execute_command sudo /bin/bash -c "source /etc/bash.bashrc"

# Output a message indicating completion
echo "Script execution completed."

# Display the log file
echo "Log file: $LOG_FILE"
