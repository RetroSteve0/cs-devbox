# codespace-env-tmp
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/RetroSteve0/universal-ubuntu-dev-template)

This template builds a Codespace using the Universal Ubuntu image and applies the following configuration:
```json
{
    "build": {
        "dockerfile": "./Dockerfile",
        "context": "."
    },
    "features": {
        "ghcr.io/devcontainers/features/common-utils:2": {
            "username": "codespace",
            "userUid": "1000",
            "userGid": "1000"
        },
        "ghcr.io/devcontainers/features/dotnet:1": {
            "version": "7",
            "installUsingApt": "false",
            "additionalVersions": "6"
        },
        "ghcr.io/devcontainers/features/hugo:1": {
            "version": "latest"
        },
        "ghcr.io/devcontainers/features/node:1": {
            "version": "20",
            "additionalVersions": "18"
        },
        "./local-features/nvs": "latest",
        "ghcr.io/devcontainers/features/python:1": {
            "version": "3.10.8",
            "additionalVersions": "3.9.16",
            "installJupyterlab": "true",
            "configureJupyterlabAllowOrigin": "*"
        },
        "./local-features/machine-learning-packages": "latest",
        "ghcr.io/devcontainers/features/php:1": {
            "version": "8.2.1",
            "additionalVersions": "8.1.14",
            "installComposer": "true"
        },
        "ghcr.io/devcontainers/features/conda:1": {
            "version": "latest"
        },
        "ghcr.io/devcontainers/features/ruby:1": {
            "version": "3.2",
            "additionalVersions": "3.1"
        },
        "ghcr.io/devcontainers/features/java:1": {
            "version": "17",
            "additionalVersions": "11",
            "installGradle": "true",
            "installMaven": "true"
        },
        "ghcr.io/devcontainers/features/sshd:1": {
            "version": "latest"
        },
        "ghcr.io/devcontainers/features/git:1": {
            "version": "latest",
            "ppa": "false"
        },
        "ghcr.io/devcontainers/features/git-lfs:1": {
            "version": "latest"
        },
        "ghcr.io/devcontainers/features/github-cli:1": {
            "version": "latest"
        },
        "ghcr.io/devcontainers/features/docker-in-docker:2": {
            "version": "latest"
        },
        "ghcr.io/devcontainers/features/kubectl-helm-minikube:1": {
            "version": "latest"
        },
        "ghcr.io/devcontainers/features/go:1": {
            "version": "latest"
        },
        "./local-features/jekyll": "latest",
        "ghcr.io/devcontainers/features/oryx:1": "latest",
        "./local-features/setup-user": "latest",
        "./local-features/patch-python": {},
        "./local-features/patch-conda": {}
    },
    "overrideFeatureInstallOrder": [
        "ghcr.io/devcontainers/features/common-utils",
        "ghcr.io/devcontainers/features/git",
        "ghcr.io/devcontainers/features/dotnet",
        "ghcr.io/devcontainers/features/hugo",
        "ghcr.io/devcontainers/features/node",
        "./local-features/nvs",
        "ghcr.io/devcontainers/features/conda",
        "./local-features/patch-conda",
        "ghcr.io/devcontainers/features/python",
        "./local-features/patch-python",
        "./local-features/machine-learning-packages",
        "ghcr.io/devcontainers/features/php",
        "ghcr.io/devcontainers/features/ruby",
        "ghcr.io/devcontainers/features/java",
        "ghcr.io/devcontainers/features/sshd",
        "ghcr.io/devcontainers/features/git-lfs",
        "ghcr.io/devcontainers/features/github-cli",
        "ghcr.io/devcontainers/features/docker-in-docker",
        "ghcr.io/devcontainers/features/kubectl-helm-minikube",
        "ghcr.io/devcontainers/features/go",
        "./local-features/jekyll",
        "ghcr.io/devcontainers/features/oryx",
        "./local-features/setup-user"
    ],
    "remoteUser": "codespace",
    "containerUser": "codespace",

    // Use 'forwardPorts' to make a list of ports inside the container available locally.
    // "forwardPorts": [],

    // Configure tool-specific properties.
    "customizations": {
        // Configure properties specific to VS Code.
        "vscode": {
            // Set *default* container specific settings.json values on container create.
            "settings": {
                "go.toolsManagement.checkForUpdates": "local",
                "go.useLanguageServer": true,
                "go.gopath": "/go",
                "python.defaultInterpreterPath": "/home/codespace/.python/current/bin/python3",
                "python.formatting.autopep8Path": "/usr/local/py-utils/bin/autopep8",
                "python.formatting.blackPath": "/usr/local/py-utils/bin/black",
                "python.linting.flake8Path": "/usr/local/py-utils/bin/flake8",
                "python.linting.flake8Enabled": false,
                "python.linting.mypyPath": "/usr/local/py-utils/bin/mypy",
                "python.linting.mypyEnabled": false,
                "python.linting.pylintPath": "/usr/local/py-utils/bin/pylint",
                "python.linting.pylintEnabled": false,
                "jupyter.kernels.filter": [
                    {
                        "path": "/opt/conda/bin/python",
                        "type": "pythonEnvironment"
                    },
                    {
                        "path": "/usr/local/python/current/bin/python3",
                        "type": "pythonEnvironment"
                    },
                    {
                        "path": "/usr/local/python/current/bin/python",
                        "type": "pythonEnvironment"
                    },
                    {
                        "path": "/usr/bin/python3",
                        "type": "pythonEnvironment"
                    },
                    {
                        "path": "/bin/python3",
                        "type": "pythonEnvironment"
                    }
                ],
                "lldb.executable": "/usr/bin/lldb"
            },
            // Add the IDs of extensions you want installed when the container is created.
            "extensions": [
                "GitHub.vscode-pull-request-github"
            ]
        }
    }
}
```
