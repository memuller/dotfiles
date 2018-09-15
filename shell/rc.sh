#!/bin/bash

# loads libs
source $DOTFILES_PATH/shell/libs.sh

# WP-CLI directory
PATH=$HOME/.wp-cli/bin:$PATH

# some more ls aliases; or exa (if installed)
which exa >/dev/null 2>/dev/null
if [ $? = 1 ]; then
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls'
else
  alias ll='exa -l --git'
  alias la='exa -a'
  alias lf='exa -bgHliS'
  alias l='ll'
fi

#sudo preserves path
#alias sudo="sudo env PATH=$PATH"

#cl : cd with a ls
function cl () {
  cd $1 && l
}

# Are we on Windows WSL?
if [ `uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/p'` ]; then
  export WSL=1
fi

# OSX-specific
if [ `uname` = 'Darwin' ]; then
  source $DOTFILES_PATH/shell/darwin.sh
fi

# Linux-specific; only if not WSL
if [ -z ${WSL} ] && [ `uname -o` = 'GNU/Linux' ]; then
  source $DOTFILES_PATH/shell/true_linux.sh
fi

# Linux (including WSL)
if [ `uname -o` = 'GNU/Linux' ]; then
  source $DOTFILES_PATH/shell/linux.sh
fi

# some useful commands
source ~/Repos/env/dotfiles/lib/unix_utils.sh

# Windows WSL-specific
if [ $WSL ]; then
  source $DOTFILES_PATH/shell/wsl.sh
fi


if [ -d "$HOME/Repos/ruby/danbooru-ruby-grabber" ]; then
  source ~/Repos/ruby/danbooru-ruby-grabber/aliases
fi

if [ -d "$HOME/Repos/env/vubuntu" ]; then
  source ~/Repos/env/vubuntu/vubuntu.sh
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -x "$(command -v fd)" ]; then
  export FZF_DEFAULT_COMMAND='fd --type f --follow'
fi

# Autoenv
[ -d ~/.autoenv ] && source ~/.autoenv/activate.sh

# ruby is fun
alias be='bundle exec'

# git
alias g='git'

#python
alias py='python'
alias py2='python2'
alias py3='python3'

# docker
alias dc='docker-compose'