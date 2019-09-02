#!/bin/bash

command -v brew >/dev/null 2>/dev/null
if [ $? = 0 ]; then
  export BREW_PREFIX="$(brew --prefix)"
fi 

alias wget="curl -O"
