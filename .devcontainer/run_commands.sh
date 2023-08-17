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

# Function to install required Python compilation dependencies
install_python_dependencies() {
    echo "Ensuring required dependencies to compile Python are installed."

    # Check if each package is already installed
    packages=("libbz2-dev" "libncurses5-dev" "libncursesw5-dev" "libffi-dev" "libreadline-dev" "libsqlite3-dev" "liblzma-dev")
    
    for package in "${packages[@]}"; do
        if ! dpkg -s "$package" > /dev/null 2>&1; then
            echo "Installing $package..."
            echo | sudo -S apt-get install "$package" -y
        fi
    done
    
    echo "Required Python dependencies installed."
}

# Prompting user if they plan to use Codespace as primary dev env
read -p 'Do you plan to use this Codespace as your primary dev environment? (yes/no): ' use_primary_env

case "$use_primary_env" in
    [yY]|[yY][eE][sS])
        generate_ssh_key
        echo "Adding SSH key to ssh-agent..."
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_ed25519
        echo "SSH key added to ssh-agent."
        display_public_key
        ;;
esac

read -p 'Do you plan on developing with Node.js? (yes/no): ' install_nvm

case "$install_nvm" in
    [yY]|[yY][eE][sS])
        # Install Node Version Manager (NVM)
        echo "Installing Node Version Manager (NVM)..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
        echo "NVM installed."

        # Load NVM into the current shell session
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

        # Prompt user for Node.js installation
        read -p 'Do you want to install Node.js? (yes/no): ' install_node

        case "$install_node" in
            [yY]|[yY][eE][sS])
                # Prompt user for Node.js version choice
                read -p 'Do you want to install the latest version or the latest LTS version of Node.js? (current/lts): ' node_version_choice

                case "$node_version_choice" in
                    [cC][uU][rR][rR][eE][nN][tT])
                        echo "Installing the latest version of Node.js..."
                        nvm install node
                        echo "Node.js installed."
                        ;;
                    [lL][tT][sS])
                        echo "Installing the latest LTS version of Node.js..."
                        nvm install --lts
                        echo "Node.js installed."
                        ;;
                    *)
                        echo "Invalid choice. Skipping Node.js installation."
                        ;;
                esac
                ;;
            *)
                echo "Skipping Node.js installation."
                ;;
        esac
        ;;
    *)
        echo "Skipping Node.js installation."
        ;;
esac

# Prompt user about Python development
read -p 'Do you plan on developing with Python? (yes/no): ' install_pyenv

case "$install_pyenv" in
    [yY]|[yY][eE][sS])
        echo "Installing pyenv..."
        curl https://pyenv.run | bash
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
        echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
        echo 'eval "$(pyenv init -)"' >> ~/.bashrc
        echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

        # Initialize pyenv directly in the current shell
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"

        # Prompt user for Python installation
        read -p 'Do you want to install Python? (yes/no): ' install_python

        case "$install_python" in
            [yY]|[yY][eE][sS])
                install_python_dependencies

                read -p 'Do you want to install the latest version of Python or a specific version? (latest/version): ' install_version

                case "$install_version" in
                    [lL][aA][tT][eE][sS][tT])
                        echo "Installing the latest version of Python..."
                        selected_version=$(pyenv install --list | grep -E "^\s*[0-9]+\.[0-9]+\.[0-9]+$" | grep -vE ".*(\bdev\b|\brc\b).*" | tail -n 1)
                        selected_version=$(echo "$selected_version" | xargs)  # Remove leading/trailing whitespace
                        pyenv install "$selected_version"
                        echo "Python $selected_version installed."
                        ;;
                    [vV][eE][rR][sS][iI][oO][nN])
                        read -p 'Enter the Python version you want to install (e.g., 3.8.12): ' py_version
                        echo "Installing Python $py_version..."
                        pyenv install "$py_version"
                        echo "Python $py_version installed."
                        selected_version="$py_version"
                        ;;
                    *)
                        echo "Invalid choice. Skipping Python installation."
                        ;;
                esac

                read -p "Do you want to set Python $selected_version as the global default? (yes/no): " set_global_py

                case "$set_global_py" in
                    [yY]|[yY][eE][sS])
                        selected_version=$(echo "$selected_version" | xargs)  # Remove leading/trailing whitespace
                        echo "Setting Python $selected_version as the global default..."
                        pyenv global "$selected_version"
                        echo "Python version set as global default."
                        ;;
                    *)
                        echo "Skipping setting global Python version."
                        ;;
                esac
                ;;
            *)
                echo "Skipping Python installation."
                ;;
        esac
        ;;
    *)
        echo "Skipping Python installation."
        ;;
esac
