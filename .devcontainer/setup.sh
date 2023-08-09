#!/bin/bash

# Prompt for username
read -p "Enter username: " username

# Prompt for password (without echoing to terminal)
read -s -p "Enter password: " password
echo

# Generate a random salt of 16 bytes
salt=$(head -c 16 /dev/urandom | base64)

# Use the salt in password hashing
hashed_password=$(openssl passwd -6 -salt $salt $password)

# Create new sudoer with hashed password and /bin/bash shell
sudo useradd -m -s /bin/bash -G sudo -p "$hashed_password" $username

# Update system
sudo apt-get update
sudo apt-get upgrade -y