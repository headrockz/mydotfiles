# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Poetry
export PATH="/$HOME/.local/bin:$PATH"
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$(pyenv root)/shims:$PATH"

# echo 'eval "$(pyenv virtualenv-init -)"'

if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

# alias
alias py="python"
alias d="docker"
alias dc="docker-compose"
alias dn="dotnet"
alias gs="git status"
alias gadd="git add ."
alias gc="git commit -am"
alias gp="git push"
alias gpull="git pull"
alias update="sudo apt update -y && sudo apt dist-upgrade -y && sudo apt autoclean ; sudo apt autoremove -y"
alias backup="rsync -rv --exclude=venv projects projects-old"
