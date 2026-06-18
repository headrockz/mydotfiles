# Asafe's dotfiles

This repository holds my dotfiles and configurations.

## Setup

- **Shell:** `zsh`
- **Prompt:** [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh) (config: `my_posh_config.omp.json`)
- **Plugins:**
  - [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
  - [zsh-completions](https://github.com/zsh-users/zsh-completions)
  - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

## Repository Structure

- `.zsh/`: Contains modular Zsh configurations.
  - `aliases.zsh`: Shell aliases.
  - `functions.zsh`: Custom shell functions.
- `.zshrc`: Main Zsh configuration.
- `my_posh_config.omp.json`: Oh-my-posh theme configuration.
- `archive/`: Old or alternative configurations (Oh-My-Zsh, Powerlevel10k).
- `setup.sh`: Installation script.

## How to use

The setup script automates tool installation and symlink creation:

1. **Tool Installation:** Installs `oh-my-posh` via official `curl` script.
2. **Zsh Plugins:** Clones `zsh-autosuggestions`, `zsh-completions`, and `fast-syntax-highlighting` to `~/.zsh/`.
3. **Symlinks:** Links `.zshrc`, aliases, functions, and the Oh-My-Posh config to your home directory (overwrites existing files).

```bash
chmod +x setup.sh
./setup.sh
```
