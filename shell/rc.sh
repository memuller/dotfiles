#!/bin/bash

# loads libs
source $DOTFILES_PATH/shell/libs.sh

# some useful commands
source $DOTFILES_PATH/lib/unix_utils.sh

# WP-CLI directory
PATH=$HOME/.wp-cli/bin:$PATH

# some more ls aliases; or exa (if installed)
if [ "$(iscmd exa)" = 1 ]; then
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls'
else
  alias ls="exa --git"
  alias ll='exa -l --git'
  alias la='exa -a --git'
  alias lf='exa -bgHliS'
  alias l='ll'
fi

#sudo preserves path
#alias sudo="sudo env PATH=$PATH"

#cl : cd with a ls
function cl () {
  cd $@ && l
}
alias c="cl"

# Are we on Windows WSL?
if [ `uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/p'` ]; then
  export WSL=1
fi

# Are we on Windows WSL2?
if [ `uname -r | sed -n 's/.*\( *microsoft-standard *\).*/\1/p'` ]; then
  export WSL=1
  export WSL2=1
fi

# OSX-specific
if [ `uname` = 'Darwin' ]; then
  source $DOTFILES_PATH/shell/darwin.sh

# Linux-specific; only if not WSL
elif [ -z ${WSL} ] && [ `uname -o` = 'GNU/Linux' ]; then
  source $DOTFILES_PATH/shell/true_linux.sh

# Linux (including WSL)
elif [ `uname -o` = 'GNU/Linux' ]; then
  source $DOTFILES_PATH/shell/linux.sh
fi

# Windows WSL-specific
if [ $WSL ]; then
  source $DOTFILES_PATH/shell/wsl.sh
fi


if [ -d "$REPOS/ruby/danbooru-ruby-grabber" ]; then
  source $REPOS/ruby/danbooru-ruby-grabber/aliases
fi

if [ -d "$REPOS/env/vubuntu" ]; then
  source $REPOS/env/vubuntu/vubuntu.sh
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -x "$(iscmd fd)" ]; then
  export FZF_DEFAULT_COMMAND='fd --type f --follow'
fi

if [ -x "$(iscmd fasd)" ]; then
  fasd_cache="$HOME/.fasd-init-cache"
  if [ "$(iscmd fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-setup zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache

  alias v="f -e vim"
  alias vz="z -e vim"
  alias o="f -e xdg-open"
fi

# Autoenv
[ -d ~/.autoenv ] && source ~/.autoenv/activate.sh

# Docker/Kubes stuff
if [ -x "$(iscmd kompose)" ]; then
  source <(kompose completion zsh)
fi
if [ -x "$(iscmd kubectl)" ]; then
  source <(kubectl completion zsh)
fi

# Global aliases
if [ "$ZSH_VERSION" ]; then
  alias -g "#null"=">/dev/null"\
    "#errnull"="1>&2"
fi

# ruby is fun
alias be='bundle exec'

# git
alias g='git'

#python
alias py='python3'
alias py2='python2'
alias py3='python3'
# alias python='python3'
# alias pip='pip3'

# docker
alias dc='docker-compose'
alias k='kubectl'
