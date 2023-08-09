# Ubuntu Dev Environment
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/RetroSteve0/cs-devbox)

This template builds a clean base Ubuntu Codespace. This Codespace runs a script that performs some post imaging tasks, such as ensuring all packages are up to date. By default Codespaces uses an account named `vscode`. Some commands can be executed with `sudo` without needing the password, but others will prompt you for your password. Instead of resetting the password to the built in `vscode` account, it is better practice to create your own account, leaving this one untouched.


## Create a new user
```bash
adduser username
```

## Add the user to sudoers (Optional, but recommended)
If you wish to perform sudo commands, you will want to add your user to the `sudo` group.
```bash
usermod -aG sudo username
```

## Test for sudo permissions
### Switch to your new user
```bash
sudo - username
```

## List sudo permissions
```bash
sudo -l
```

If the output of `sudo -l` is  `(root) ALL: ALL` then you've done everything right and you're good to go.
