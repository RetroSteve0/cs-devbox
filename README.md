# Ubuntu Dev Environment
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/RetroSteve0/cs-devbox)

## Using the Script
Once the Codespace has initialized, run the following command:
```bash
.devcontainer/setup.sh
```

The script will walk you through creating a new user, adding it to the sudo group, generating a random salt, hashing your password, updating the system, and finally logging into the user. Nothing is ever stored in plain text (except for the username) which makes the script secure. As with any script, analyze the bash script yourself before proceeding to run it.

Once you've ran the script and logged in with the user it creates, you then may proceed with your own customizations.

## Proceed with other customizations
Aside from creating your own sudoer user account, here are some recommendations:

- Install [Node Version Manager](https://github.com/nvm-sh/nvm)
  - Install Node.js version of choice using `nvm`
- Install [Pyenv](https://github.com/pyenv/pyenv)
  - Install Python3 version of choice with `pyenv`
- Restore manpages with `sudo unminimize`
- ...and finally, install any other tools you may use such as a C++ compiler, .NET Core, or any other language compilers or interpreters you develop with.

Just a note: After installing `nvm` and `pyenv`, you may need to run `source ~/.bashrc` to get the shell to recognize the new environment variables the installers create -- or simply start a new shell session.
