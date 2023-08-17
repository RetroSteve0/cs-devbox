#!/bin/bash

# Function to generate SSH key and print to screen
generate_ssh_key() {
    read -p "Enter your email address: " email
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "$email"
    echo "SSH key generated."
}


}# Function to display public key and instructions
display_public_key() {
    # Write instructions to public_key.txt
    echo "Copy and paste the contents of this file to GitHub: https://github.com/settings/ssh/new" > public_key.txt

    # Append public key to public_key.txt
    cat ~/.ssh/id_ed25519.pub >> public_key.txt

    # Open the file with nano
    cat public_key.txt
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

# Destroy session
echo "Destroying session for $USER..."
