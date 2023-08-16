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

The script will walk you through creating a new user, adding it to the sudo group, generating a random salt, hashing your password, updating the system, and finally logging into the user. Nothing is ever stored in plain text (except for the username) which makes the script secure. Additionally the script will ask if you intend to use this Codespace as a dev environment and will walk you through creating an SSH key to import in your GitHub account. Otherwise, when you attempt to `git push` any commits you'll be met with a `Permission denied` error.

Take caution with any third party scripts ran that you did not create yourself to ensure there is no malicious code that is being executed.

## Proceed with other customizations
Now you can begin customizing the Codespace to your liking.

* `nvm` and `pyenv` are two useful tools for developers working with Node.js and Python.
* Add any VS Code extensions you wish to use to your own [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json) file.
* If you maintain your environment, you should only have to go through this once, considering you log in to your environment at least once every .30 days
