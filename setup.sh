#!/bin/bash

# Get the directory where the script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "------------------------------------------"
echo "Setting up dotfiles from $DOTFILES_DIR"
echo "------------------------------------------"

# 1. Install Oh-My-Posh (via official curl script)
if ! command -v oh-my-posh &> /dev/null; then
    echo "Installing Oh-My-Posh..."
    curl -s https://ohmyposh.dev/install.sh | bash -s
else
    echo "Oh-My-Posh is already installed."
fi

# 2. Install Zsh Plugins & Custom Files
ZSH_PLUGINS_DIR="$HOME/.zsh"
mkdir -p "$ZSH_PLUGINS_DIR"

install_plugin() {
    local name=$1
    local repo=$2
    if [ ! -d "$ZSH_PLUGINS_DIR/$name" ]; then
        echo "Installing plugin: $name..."
        git clone --depth 1 "$repo" "$ZSH_PLUGINS_DIR/$name"
    else
        echo "Plugin $name already installed."
    fi
}

install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
install_plugin "zsh-completions" "https://github.com/zsh-users/zsh-completions"
install_plugin "fast-syntax-highlighting" "https://github.com/zdharma-continuum/fast-syntax-highlighting"

# Link aliases and functions
echo "Linking aliases and functions..."
ln -sf "$DOTFILES_DIR/.zsh/aliases.zsh" "$ZSH_PLUGINS_DIR/aliases.zsh"
ln -sf "$DOTFILES_DIR/.zsh/functions.zsh" "$ZSH_PLUGINS_DIR/functions.zsh"

# 3. Create Symlinks for main files
echo "Creating symlinks for main files (overwriting existing)..."
FILES=(".zshrc" "my_posh_config.omp.json")

for file in "${FILES[@]}"; do
    echo "Linking ~/$file -> $DOTFILES_DIR/$file"
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
done

echo "------------------------------------------"
echo "Setup complete!"
echo "Restart your terminal or run: source ~/.zshrc"
echo "------------------------------------------"
