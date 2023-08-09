# Ubuntu Dev Environment
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/RetroSteve0/ubuntu-dev)

This template builds a clean base Ubuntu Codespace.

## Create your user
By default Codespaces uses a user named `vscode`.

```bash
➜ /workspaces/ubuntu-dev (main) $ sudo -l
Matching Defaults entries for vscode on codespaces-56edb8:
    env_reset, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin,
    use_pty

User vscode may run the following commands on codespaces-56edb8:
    (root) NOPASSWD: ALL
```

While this user does have the `NOPASSWD: ALL` property, some processes such as running `sudo -u postgres psql` prompts for a password for the `vscode` user. Therefore, it is a good idea to create a separate account with sudo access while leaving the default `vscode` account untouched.

### Create a new user
```bash
adduser username
```

### Add the user to sudoers
```bash
usermod -aG sudo username
```

### Test the user
```bash
sudo - username
```

If you receive anew prompt after typing the password you set for the user you just created and the `whoami` command returns your new username, you should be set. Running `sudo -l` is also a good test. If you see something similar to `(root) NOPASSWD: ALL`, you're good to go. You know the password, so now if you're prompted for a password for any commands you can now successfully authenticate.