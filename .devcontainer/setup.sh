#!/bin/bash

# Function to prompt for password and confirm
prompt_for_password() {
    read -s -p "Enter password: " password
    echo
    read -s -p "Confirm password: " confirm_password
    echo
}

# Prompt for username
read -p "Enter username: " username

# Prompt for passwords until they match
while true; do
    prompt_for_password

    if [ "$password" = "$confirm_password" ]; then
        break
    else
        echo "Passwords do not match. Please try again."
    fi
done

# Generating a random salt
echo -n "Generating a random salt... "
salt=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 16)
echo "Done."

# Hashing the password using salt
echo -n "Hashing the password... "
hashed_password=$(python3 -c "import crypt; print(crypt.crypt('$password', '\$6\$$salt'))")
echo "Done."

# Creating the user account
echo -n "Creating user account... "
sudo useradd -m -s /bin/bash -G sudo -p "$hashed_password" "$username"
echo "Done."

# Updating the system
echo -n "Updating the system... "
sudo apt-get update -y
sudo apt-get upgrade -y

# Log in as the new user and execute additional commands
echo "Attempting to run commands as $username..."
su - "$username" -c "/bin/bash .devcontainer/run_commands.sh"

echo "Script completed successfully."
exit 0
