#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

has() {
  type "$1" > /dev/null 2>&1
}

is_osx() {
  [[ $(uname) == 'Darwin' ]]
}
is_linux() {
  [[ $(uname) == 'Linux' ]]
}

is_in_vscode() {
  [[ $TERM_PROGRAM == 'vscode' ]]
}

is_in_claude() {
  [[ -n $CLAUDECODE ]]
}

# Claude デスクトップアプリが裏で起動するログインシェル（CLAUDECODE が無い）を検出する
is_spawned_by_claude_app() {
  [[ $__CFBundleIdentifier == com.anthropic.* ]]
}

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Source Prezto.
if ! is_in_vscode && [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
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

# Auto attach or launch tmux
if ! is_in_vscode && ! is_in_claude && ! is_spawned_by_claude_app \
  && [[ ! -n $TMUX && $- == *l* ]] && [[ -o interactive ]] && [[ -t 0 && -t 1 ]]; then
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
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
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

bindkey -e

