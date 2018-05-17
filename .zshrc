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

# rbenv
eval "$(rbenv init -)"

# Customize to your needs...
alias ls='ls -G'
alias ll='ls -hl'

# AWS CLI
source /usr/local/bin/aws_zsh_completer.sh

