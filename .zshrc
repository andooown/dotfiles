#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

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

has() {
  type "$1" > /dev/null 2>&1
}

is_osx() {
  [[ $(uname) == 'Darwin' ]]
}
is_linux() {
  [[ $(uname) == 'Linux' ]]
}

# Auto attach or launch tmux
if [[ ! -n $TMUX && $- == *l* ]]; then
  if tmux list-session > /dev/null 2>&1; then
    tmux attach-session
  else
    tmux new-session
  fi
fi

if has "direnv"; then
  eval "$(direnv hook zsh)"
fi

if has "asdf"; then
  ASDF_DIR=$(brew --prefix asdf)
  source $ASDF_DIR/asdf.sh
fi

if has "anyenv" || [ -e $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"

  if has "pipenv"; then
    export PIPENV_VENV_IN_PROJECT=true
    eval "$(pipenv --completion)"
  fi

  if has "goenv"; then
    eval "$(goenv init -)"
  fi
fi

if has "gcloud" && is_osx; then
  # gcloud
  source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
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

