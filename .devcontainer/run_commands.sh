#!/bin/bash

# Function to generate SSH key and print to screen
generate_ssh_key() {
    read -p "Enter your email address: " email
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "$email"
}


# Function to display public key and instructions
display_public_key() {
    echo -n "Here is your public key: "
    cat ~/.ssh/id_ed25519.pub
    echo "Paste your public key at https://github.com/settings/ssh/new. If you have any issues, please see the README.md of this repo for detailed instructions."
}

# Prompting user if they plan to use Codespace as primry dev env
read -p 'Do you plan to use this Codespace as your primary dev environment? (yes/no): ' use_primary_env

if [[ "$use_primary_env" == "yes" || "$use_primary_env" == "y" ]]; then
    generate_ssh_key
    echo "Adding SSH key to ssh-agent..."
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    echo "SSH key added to ssh-agent."
    display_public_key
fi
