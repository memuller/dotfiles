#!/bin/bash

# adds local sbin/bin directories, if there're there
if [ -d "/usr/local/bin" ] ; then
  PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

[ -d $HOME/.local/bin ] && PATH="$HOME/.local/bin:$PATH"

# Adds Chef stuff to path, if exists
[ -d /opt/chef ] && PATH="/opt/chef/bin:$PATH"

# Adds Google Cloud SDK
[ -d $HOME/.google-cloud-sdk ] && PATH="$HOME/.google-cloud-sdk/bin:$PATH"

# adds Android SDK to path, if it's there
if [ -d "$HOME/.android" ] ; then
    PATH="$HOME/.android/tools:$PATH"
fi

# adds git prompt/completion stuff from home
if [ -f "$HOME/.bin/git-prompt.sh" ]; then
  source ~/.bin/git-completion.bash
  source ~/.bin/git-prompt.sh
fi

# Volta
if [ -d "$HOME/.volta" ]; then
  export VOLTA_HOME=$HOME/.volta
  export PATH="$VOLTA_HOME/bin:$PATH"
fi

# Nodenv
if [ -d "$HOME/.nodenv" ]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

# NW.JS
[ -d "$HOME/.nwjs" ] && export PATH="$HOME/.nwjs:$PATH"

# RBENV
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# PHPENV
if [ -d "$HOME/.phpenv" ]; then
  export PATH="$HOME/.phpenv/bin:$PATH"
  eval "$(phpenv init -)"
fi

# Composer
if [ -d "$HOME/.config/composer" ]; then
  export COMPOSER_HOME="$HOME/.config/composer"
elif [ -d "$HOME/.composer" ]; then
  export COMPOSER_HOME="$HOME/.composer"
fi
if [ -n ${COMPOSER_HOME} ]; then
  export PATH="$PATH:$COMPOSER_HOME/vendor/bin"
fi

# Rust and Cargo
if [ -d "$HOME/.cargo" ]; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi

# FNM
if [ -d "$HOME/.fnm" ]; then
  export PATH=/home/memuller/.fnm:$PATH
  eval "`fnm env`"
fi

# Deno =D
export DENO_INSTALL="/home/memuller/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Virtualenv loading/unloading
autoload -U add-zsh-hook
load-virtualenv() {
    if [ -d "venv" ]; then
      source ./venv/bin/activate
    else
      declare -f deactivate > /dev/null;
      if [ $? -eq 0 ]; then
        deactivate
      fi
    fi
}
add-zsh-hook chpwd load-virtualenv
load-virtualenv