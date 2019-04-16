#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

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

# go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

has() {
  type "$1" > /dev/null 2>&1
}

is_osx() {
  [[ $(uname) == 'Darwin' ]]
}
is_linux() {
  [[ $(uname) == 'Linux' ]]
}

if has "anyenv" || [ -e $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# goenv
if has "goenv" || [ -e $HOME/.goenv ]; then
  export GOENV_ROOT=$HOME/.goenv
  export PATH=$GOENV_ROOT/bin:$PATH
  eval "$(goenv init -)"
fi
# rbenv
if has "rbenv" || [ -e $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
# pyenv/pipenv
if has "pyenv" || [ -e $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"

  if has "pipenv"; then
    export PIPENV_VENV_IN_PROJECT=true
    eval "$(pipenv --completion)"
  fi
fi
# nodenv
if has "nodenv" || [ -e $HOME/.nodenv ]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

if has "gcloud" && is_osx; then
  # gcloud
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

# Alias
alias ls='ls -G'
alias ll='ls -hl'

# Load other config files
if [ -e $HOME/.zsh_prompt ]; then
  source $HOME/.zsh_prompt
fi
if [ -e $HOME/.zsh_function ]; then
  source $HOME/.zsh_function
fi
if [ -e $HOME/.zsh_keybind ]; then
  source $HOME/.zsh_keybind
fi
if [ -e $HOME/.zsh_local_env ]; then
  source $HOME/.zsh_local_env
fi

