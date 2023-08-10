#!/bin/bash

# Function to prompt for password and confirm
prompt_for_password() {
    read -s -p "Enter password: " password
    echo
    read -s -p "Confirm password: " confirm_password
    echo
}

# Function to display animated progress on the same line
animate_progress() {
    local delay_seconds="$1"
    local max_dots=3
    local dots=""
    
    echo -n " ["
    
    for ((i = 0; i < max_dots; i++)); do
        dots+="."
        echo -n "$dots"
        sleep "$delay_seconds"
    done
    
    echo -n "]"
}

# Step 1: Prompt for username
read -p "Enter username: " username

# Print animated progress on the same line
echo -n "Creating user account"
animate_progress 1
echo " Done."

# Step 2: Prompt for passwords until they match
echo "Enter and confirm password"
while true; do
    prompt_for_password

    if [ "$password" = "$confirm_password" ]; then
        break
    else
        echo "Passwords do not match. Please try again."
    fi
done

# Print animated progress on the same line
echo -n "Creating random salt"
animate_progress 1
echo " Done."

# Step 3: Generating a random salt
salt=$(openssl rand -hex 16)

# Print animated progress on the same line
echo -n "Hashing the password"
animate_progress 1
echo " Done."

# Step 4: Hashing the password using salt
hashed_password=$(openssl passwd -6 -salt "$salt" "$password")

# Print animated progress on the same line
echo -n "Creating the user account"
animate_progress 1
echo " Done."

# Step 5: Creating the user account
sudo useradd -m -s /bin/bash -G sudo -p "$hashed_password" "$username"
echo "User account created successfully."

# Print animated progress on the same line
echo -n "Updating the system"
animate_progress 1
echo " Done."

# Step 6: Updating the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Log in as the new user
echo "Logging in as the new user..."
su - "$username"

echo "Script completed successfully."
exit 0
