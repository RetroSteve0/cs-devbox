# Ubuntu Dev Environment
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/RetroSteve0/cs-devbox)

This template builds a clean base Ubuntu Codespace. This Codespace runs a script that performs some post imaging tasks, such as ensuring all packages are up to date and running the `unminimize` command to restore removed manpages.

Normally, a Codespace is not meant to be logged in to and interactively managed and as such the manpages are minimized by default to reduce the size. However, I use Codespaces for a different purpose -- as a Linux VM that I fully manage for development.

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
Now you can proceed with further customizing the install. Any steps you do, you can try to add to the setup.sh file to automate them if you need to create a new Codespace for any reason. I tried to include `pyenv` and `nvm` in the script, but these packages are meant to be ran at the user level and as such it is best that they are manually installed from the user which they will be used from.
