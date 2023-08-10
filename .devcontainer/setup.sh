#!/bin/bash

# Switch to root
sudo su

# Update system
sudo apt-get update
sudo apt-get upgrade -y

# Install NVM
sudo git clone https://github.com/nvm-sh/nvm.git /usr/local/nvm
sudo chown -R root:root /usr/local/nvm
echo 'export NVM_DIR="$HOME/.nvm"' | sudo tee -a /etc/bash.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' | sudo tee -a /etc/bash.bashrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' | sudo tee -a /etc/bash.bashrc

# Install Pyenv
sudo git clone https://github.com/pyenv/pyenv.git /usr/local/pyenv
sudo chown -R root:root /usr/local/pyenv
echo 'export PYENV_ROOT="/usr/local/pyenv"' | sudo tee -a /etc/bash.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' | sudo tee -a /etc/bash.bashrc
echo 'eval "$(pyenv init -)"' | sudo tee -a /etc/bash.bashrc
