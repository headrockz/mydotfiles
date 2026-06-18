# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/my_posh_config.omp.json)"

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Zsh Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Custom files
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh

# Poetry
export PATH="/$HOME/.local/bin:$PATH"
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$(pyenv root)/shims:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

# Added by Antigravity
export PATH="/Users/asafe/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity CLI installer
export PATH="/Users/asafe/.local/bin:$PATH"

# Added by Antigravity IDE
export PATH="/Users/asafe/.antigravity-ide/antigravity-ide/bin:$PATH"
