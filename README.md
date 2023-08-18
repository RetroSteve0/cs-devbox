# Universal Dev Environment

Welcome to the Universal Dev Environment – a versatile and customizable development setup powered by the `mcr.microsoft.com/devcontainers/base:jammy` image.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/RetroSteve0/cs-devbox)  
![Codespaces Compatible](https://img.shields.io/badge/Codespaces-Compatible-brightgreen)

## Prerequisites

- A GitHub account
- Basic familiarity with terminal commands

## Purpose

Designed to create a development environment to take with you -- all you need is a device that is capable of running a web browser. Customization scripts allow you to effortlessly create a sudo user, update the system, and set up development for the two most popular programming environments: `python` and `node.js`.

## Quick Setup

1. Get started quickly by using this repository as a template to create your new Codespace:
   - Click the "Use this template" button to generate a repository based on this template.
   - Visit your new repository, and click the "Code" button, then select "Open with Codespaces."

2. Navigate to the terminal within your Codespace.

3. Initiate the setup process by copying and pasting the following command:

```bash
.devcontainer/setup.sh
```

This script will seamlessly guide you through the creation of a new user, system updates, and a series of customization options, including the generation of an SSH key for GitHub integration, installing Node Version Manager, Node.js, Pyenv, Python, and Pipx.

> Note: While using third-party scripts, exercise caution to ensure there's no malicious code.

If you intend to make this Codespace your primary development environment, respond with "yes" when prompted. This will result in the generation of an SSH keypair, with your public key displayed in the terminal, once the script completes. 

## Importing Your Public Key
The customization script will provide you with your public key for your SSH certificate. Follow the steps outlined below to import that key in to your GitHUb account:

1. Visit [this link](https://github.com/settings/ssh/new) to navigate to the GitHub SSH key settings.
2. Copy and paste the public key from your Codespace terminal.
3. Assign a meaningful name to this key for easy identification.
4. Click "Create SSH Key" to finalize the process.

With your public key imported, your Codespace is now seamlessly linked to your GitHub account, enabling you to clone repositories, collaborate, and code without constraints.

You are now ready to begin coding and use your Codespace. Happy Coding!
