#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zsh-completions
for d in "/share/zsh-completions" "/share/zsh/zsh-site-functions";do
  brew_completion=$(brew --prefix 2>/dev/null)$d
  if [ $? -eq 0 ] && [ -d "$brew_completion" ];then
    fpath=($brew_completion $fpath)
  fi
done
autoload -Uz compinit
compinit

# rbenv
eval "$(rbenv init -)"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# pipenv
export PIPENV_VENV_IN_PROJECT=true
eval "$(pipenv --completion)"

# Customize to your needs...
alias ls='ls -G'
alias ll='ls -hl'

# Load other config files
if [ -e $HOME/.zsh_function ]; then
  source $HOME/.zsh_function
fi
if [ -e $HOME/.zsh_keybind ]; then
  source $HOME/.zsh_keybind
fi
if [ -e $HOME/.zsh_local_env ]; then
  source $HOME/.zsh_local_env
fi
