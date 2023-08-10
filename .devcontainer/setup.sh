#!/bin/bash

# Function to prompt for password and confirm
prompt_for_password() {
    read -s -p "Enter password: " password
    echo
    read -s -p "Confirm password: " confirm_password
    echo
}

# Function to display animated progress
animate_progress() {
    local delay_seconds="$1"
    local max_dots=3
    local dots=""

    for ((i = 0; i < max_dots; i++)); do
        dots+="."
        echo -ne "$dots\r"
        sleep "$delay_seconds"
    done
    echo
}

# Step 1: Prompt for username
read -p "Enter username: " username

# Pause with animated progress
animate_progress 1

# Step 2: Prompt for passwords until they match
while true; do
    prompt_for_password

    if [ "$password" = "$confirm_password" ]; then
        break
    else
        echo "Passwords do not match. Please try again."
    fi
done

# Pause with animated progress
animate_progress 1

# Step 3: Generating a random salt
echo "Generating a random salt"
salt=$(openssl rand -hex 16)

# Pause with animated progress
animate_progress 1

# Step 4: Hashing the password using salt
echo "Hashing the password"
hashed_password=$(openssl passwd -6 -salt "$salt" "$password")

# Pause with animated progress
animate_progress 1

# Step 5: Creating the user account
echo "Creating user account"
sudo useradd -m -s /bin/bash -G sudo -p "$hashed_password" "$username"
echo "User account created successfully."

# Pause with animated progress
animate_progress 1

# Step 6: Updating the system
echo "Updating the system"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "Script completed successfully."
exit 0
