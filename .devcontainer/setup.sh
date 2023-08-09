#!/bin/bash

# Default username and password
username="retrosteve0"
password="retrosteve0"

# Generate a random salt of 16 bytes
salt=$(head -c 16 /dev/urandom | base64)

# Use the salt in password hashing
hashed_password=$(openssl passwd -6 -salt $salt $password)

# Create new sudoer with hashed password and /bin/bash shell
sudo useradd -m -s /bin/bash -G sudo -p "$hashed_password" $username

# Update system
sudo apt-get update
sudo apt-get upgrade -y
