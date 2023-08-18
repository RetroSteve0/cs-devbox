#!/bin/bash

# Function to generate SSH key and print to screen
generate_ssh_key() {
    read -p "Enter your email address: " email
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "$email"
}

# Function to display public key and instructions
display_public_key() {
    echo "***************************************************************"
    echo "** PAUSE AND READ THIS SECTION THOROUGHLY BEFORE PROCEEDING. **"
    echo "***************************************************************"
    echo -n "Here is your public key: "
    cat ~/.ssh/id_ed25519.pub
    echo ""
    echo "Paste your public key at https://github.com/settings/ssh/new."
    echo "If you have any issues, please see the README.md of this repo"
    echo "for detailed instructions."
    echo ""
}

# Function to install required Python compilation dependencies
install_python_dependencies() {
    echo "Ensuring required dependencies to compile Python are installed."

    # Check if each package is already installed
    packages=("libbz2-dev" "libncurses5-dev" "libncursesw5-dev" "libffi-dev" "libreadline-dev" "libsqlite3-dev" "liblzma-dev")
    
    for package in "${packages[@]}"; do
        if ! dpkg -s "$package" > /dev/null 2>&1; then
            echo "Installing $package..."
            sudo apt-get install "$package" -y
        fi
    done
    
    echo "Required Python dependencies installed."
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

# # Make sure $HOME/.local/bin is in PATH
# echo "Making sure $HOME/.local/bin is in PATH..."
# echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
# source ~/.bashrc

# Prompting user if they plan to use Codespace as primary dev env
while true; do
    if prompt_yes_no "Do you plan to use this Codespace as your primary dev environment?"; then
        generate_ssh_key
        echo "Adding SSH key to ssh-agent..."
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_ed25519
        echo "SSH key added to ssh-agent."
        display_public_key
        break
    else
        echo "Skipping SSH Configuration."
        break
    fi
done

# Prompt user if they plan on developing with Node.js
while true; do
    if prompt_yes_no "Do you plan on developing with Node.js?"; then
        # Install Node Version Manager (NVM)
        echo "Installing Node Version Manager (NVM)..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
        echo "NVM installed."

        # Load NVM into the current shell session
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

        # Prompt user for Node.js installation
        while true; do
            if prompt_yes_no "Do you want to install Node.js?"; then
                # Prompt user for Node.js version choice
                while true; do
                    read -p 'Do you want to install the latest or the LTS version of Node.js? (latest/lts): ' node_version_choice

                    case "$node_version_choice" in
                        [lL][aA][tT][eE][sS][tT])
                            echo "Installing the latest version of Node.js..."
                            nvm install node
                            echo "Node.js installed."
                            break
                            ;;
                        [lL][tT][sS])
                            echo "Installing the LTS version of Node.js..."
                            nvm install --lts
                            echo "Node.js installed."
                            break
                            ;;
                        *)
                            echo "Invalid choice. Please enter 'latest' or 'lts'."
                            ;;
                    esac
                done
                break
            else
                echo "Skipping Node.js installation."
                break
            fi
        done
        break
    else
        echo "Skipping Node.js installation."
        break
    fi
done

# Prompt user about Python development
while true; do
    if prompt_yes_no "Do you plan on developing with Python?"; then
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
        while true; do
            if prompt_yes_no "Do you want to install Python?"; then
                install_python_dependencies

                while true; do
                    read -p 'Do you want to install the latest version of Python or a specific version? (latest/version): ' install_version

                    case "$install_version" in
                        [lL][aA][tT][eE][sS][tT])
                            echo "Installing the latest version of Python..."
                            selected_version=$(pyenv install --list | grep -E "^\s*[0-9]+\.[0-9]+\.[0-9]+$" | grep -vE ".*(\bdev\b|\brc\b).*" | tail -n 1)
                            selected_version=$(echo "$selected_version" | xargs)  # Remove leading/trailing whitespace
                            pyenv install "$selected_version"
                            echo "Python $selected_version installed."
                            break
                            ;;
                        [vV][eE][rR][sS][iI][oO][nN])
                            read -p 'Enter the Python version you want to install (e.g., 3.8.12): ' py_version
                            echo "Installing Python $py_version..."
                            pyenv install "$py_version"
                            echo "Python $py_version installed."
                            selected_version="$py_version"
                            break
                            ;;
                        *)
                            echo "Invalid choice. Please enter 'latest' or 'version'."
                            ;;
                    esac
                done

                while true; do
                    if prompt_yes_no "Do you want to set Python $selected_version as global default?"; then
                        selected_version=$(echo "$selected_version" | xargs)  # Remove leading/trailing whitespace
                        echo "Setting Python $selected_version as global default..."
                        pyenv global "$selected_version"
                        echo "Python $selected_version set as global default."
                        break
                    else
                        echo "Skipping setting global Python version."
                        break
                    fi
                done

                while true; do
                    if prompt_yes_no "Do you want to install pipx?"; then
                        echo "Ensuring pip is installed..."
                        python3 -m ensurepip --default-pip
                        echo "Installing pipx..."
                        python3 -m pip install --user pipx --no-warn-script-location
                        python3 -m pipx ensurepath
                        echo "pipx installed."
                        break
                    else
                        echo "Skipping pipx installation."
                        break
                    fi
                done

                break
            else
                echo "Skipping Python installation."
                break
            fi
        done
        break
    else
        echo "Skipping Pyenv installation..."
        break
    fi
done
