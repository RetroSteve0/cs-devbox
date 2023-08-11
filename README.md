# Universal Dev Environment
This Codespace is based on the universal:linux image. It contains all the tools pre-installed you will need to develop with any mainstream programming language.
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/RetroSteve0/cs-devbox)

## User Account Creation
This repo contains a script that creates a user account and updates all packages to the current latest versions.

### Running the script
Once the Codespace has initialized, run the following command:
```bash
.devcontainer/setup.sh
```

The script will walk you through creating a new user, adding it to the sudo group, generating a random salt, hashing your password, updating the system, and finally logging into the user. Nothing is ever stored in plain text (except for the username) which makes the script secure. As with any script, analyze the bash script yourself before proceeding to run it.

Once you've ran the script and logged in with the user it creates, you then may proceed with your own customizations.

## Proceed with other customizations
Now you can begin customizing the Codespace to your liking. This image already contains `nvm` as well as the `latest` current version of Node.js pre-installed. In addition, I recommend installing `[pyenv](https://github.com/pyenv/pyenv)` which is like `nvm`, but for Python. That is all you should really need to do to bein developing for just about any known popular programming language.
