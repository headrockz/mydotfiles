# Gemini Context: Asafe's Dotfiles

This repository is a modular and automated dotfiles management system for Zsh environments, optimized for macOS.

## Project Overview

- **Core Shell:** Zsh
- **Prompt Engine:** [Oh-My-Posh](https://ohmyposh.dev/) using a custom theme (`my_posh_config.omp.json`).
- **Version Management:** Integrated support for `pyenv` and `poetry`.
- **Modularity:** Configurations are split into specialized files within `.zsh/` for maintainability.
- **Architecture:** Uses a symlink-based deployment strategy managed by a central bash script.

## Key Components

- `.zshrc`: The main entry point. It handles environment variables (HISTSIZE, PATH), plugin loading, and sources modular files.
- `.zsh/aliases.zsh`: Centralized shell aliases (Git, Docker, Python, etc.).
- `.zsh/functions.zsh`: Custom utility functions for media processing (ffmpeg) and file organization.
- `setup.sh`: Automated installer that handles dependency checks (Oh-My-Posh), plugin cloning, and symlink creation.
- `archive/`: Storage for deprecated configurations (Oh-My-Zsh, Powerlevel10k) preserved for reference.

## Setup and Maintenance

### Initial Installation
To set up the environment on a new machine:
```bash
chmod +x setup.sh
./setup.sh
```

### Deploying Changes
The `setup.sh` script uses `ln -sf` to create symlinks. Once the links are established, changes made within this repository are immediately reflected in the shell upon restart or manual sourcing:
```bash
source ~/.zshrc
```

## Development Conventions

- **Modular Sourcing:** Always use conditional sourcing in `.zshrc` to prevent errors if files are missing:
  `[[ -f ~/.zsh/filename.zsh ]] && source ~/.zsh/filename.zsh`
- **Language:** All documentation, commit messages, and code comments must be in **English**.
- **Tooling:** Prefer `curl` over `brew` for standalone tool installations in `setup.sh` to minimize external dependencies.
- **Path Management:** Add new binary paths to `.zshrc` ensuring they are appended/prepended correctly to the `PATH` variable.
- **Backups:** Local files are backed up with a `.bak` extension manually before running the setup script for the first time if they aren't already symlinks.
