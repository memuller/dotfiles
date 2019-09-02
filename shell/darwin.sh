#!/bin/bash

# Sets $BREW_PREFIX if Homebrew is installed
command -v brew >/dev/null 2>/dev/null
if [ $? = 0 ]; then
  export BREW_PREFIX="$(brew --prefix)"
fi 

alias wget="curl -O"

# Loads brew'ed PHP
[ -d "${BREW_PREFIX}/opt/php" ]  && export PATH="$(brew --prefix php)/bin/php:$PATH"

# fixes issue w/ autocompletion on multiuser Homebrew 
# happens because zcompinit refuses to run if unsafe dirs are on path but unsafe dirs (group permissions) are a common way to make brew work for multiple users
if [ $BREW_PREFIX ]; then
  alias zcompinit="zcompinit -u"
fi

# Starship theme
eval "$(starship init zsh)"