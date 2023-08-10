# Ubuntu Dev Environment
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/RetroSteve0/cs-devbox)

This template builds a clean base Ubuntu Codespace. This Codespace runs a script that runs `apt-get update` and `apt-get upgrade -y` during initialization, that way when the Codespace is brought up it is already up to date.

By default Codespaces uses an account named `vscode`. Some commands can be executed with `sudo` without needing the password, but others will prompt you for your password. Instead of resetting the password to the built in `vscode` account, it is better practice to create your own account, leaving this one untouched.

## Create a new user
```bash
adduser username
```

## Add the user to sudo group (Optional)
If you wish to perform sudo commands, you will want to add your user to the `sudo` group.
```bash
usermod -aG sudo username
```

or

```bash
adduser username sudo
```

Both commands will accomplish the same task of adding `username` to the `sudo` group.

## Test for sudo permissions (Optional)
### Switch to your new user
```bash
su username
```

## List sudo permissions (Optional)
```bash
sudo -l
```

If the output of `sudo -l` is  `(root) ALL: ALL` then you've done everything right and you're good to go.

## Proceed with other customizations
Aside from creating your own sudoer user account, here are some recommendations:

- Install [Node Version Manager](https://github.com/nvm-sh/nvm)
  - Install Node.js version of choice using `nvm`
- Install [Pyenv](https://github.com/pyenv/pyenv)
  - Install Python3 version of choice with `pyenv`
- Restore manpages with `sudo unminimize`
- ...and finally, install any other tools you may use such as a C++ compiler, .NET Core, or any other language compilers or interpreters you develop with.

Just a note: After installing `nvm` and `pyenv`, you may need to run `source ~/.bashrc` to get the shell to recognize the new environment variables the installers create -- or simply start a new shell session.
