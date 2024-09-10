# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/my_posh_config.omp.json)"

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

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
