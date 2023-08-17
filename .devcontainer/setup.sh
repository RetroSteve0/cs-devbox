#!/bin/bash

# Function to prompt for password and confirm
prompt_for_password() {
    read -s -p "Enter password: " password
    echo
    read -s -p "Confirm password: " confirm_password
    echo
}

# Function to prompt for yes/no choice
prompt_yes_no() {
    while true; do
        read -p "$1 (yes/no): " choice
        case "$choice" in
            [yY]|[yY][eE][sS]) return 0;;
            [nN]|[nN][oO]) return 1;;
            *) echo "Invalid choice. Please enter 'yes' or 'no'.";;
        esac
    done
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

# Prompt user if they want to customize the environment
if prompt_yes_no "Do you want to customize the environment?"; then
    echo "Logging in as $username..."
    su - "$username" -c "/bin/bash .devcontainer/run_commands.sh"
fi

# Prompt user to log in as the new user
if prompt_yes_no "Do you want to log in as $username?"; then
    echo "Logging in as $username..."
    su - "$username"
fi

echo "Script completed successfully."
exit 0
