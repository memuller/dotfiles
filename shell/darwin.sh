#!/bin/bash

# Sets $BREW_PREFIX if Homebrew is installed
command -v brew >/dev/null 2>/dev/null
if [ $? = 0 ]; then
  export BREW_PREFIX="$(brew --prefix)"
fi 

alias wget="curl -O"

# Loads brew'ed PHP
[ -d "${BREW_PREFIX}/opt/php" ]  && export PATH="$(brew --prefix php)/bin/php:$PATH"
