#!/bin/bash

# User setup
read -p "Enter username: " username
read -s -p "Enter password: " password
echo
salt=$(head -c 16 /dev/urandom | base64)
hashed_password=$(openssl passwd -6 -salt $salt $password)

# Create username with salted password
sudo useradd -m -G sudo -p "$hashed_password" $username

# Update system
sudo apt-get update
sudo apt-get upgrade -y
