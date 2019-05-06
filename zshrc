#!/bin/zsh

# Repository path
export REPOS="$HOME/Repos"

# Base dotfiles repository path
export DOTFILES_PATH="$HOME/Repos/env/dotfiles"

# Loads prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Loads actual zshrc stuff
source "$DOTFILES_PATH/shell/rc.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
