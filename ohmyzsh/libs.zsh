#!/bin/zsh

# adds local sbin/bin directories, if there're there
if [ -d "/usr/local/bin" ] ; then
  PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

# adds Android SDK to path, if it's there
if [ -d "$HOME/.android" ] ; then
    PATH="$HOME/.android/tools:$PATH"
fi

# adds git prompt/completion stuff from home
if [ -f "$HOME/.bin/git-prompt.sh" ]; then
  source ~/.bin/git-completion.bash
  source ~/.bin/git-prompt.sh
fi

# RVM
if [ -d "$HOME/.rvm" ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi

# NVM
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi

# Rust and Cargo
if [ -d "$HOME/.cargo" ]; then
  source $HOME/.cargo/env
fi