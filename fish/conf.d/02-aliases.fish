alias g='git'
alias dc='docker'
alias dcc='docker-compose'
alias k='kubectl'

if type -q eza
    alias eza="eza --icons"
    alias ls="eza --git"
    alias ll='eza -l --git'
    alias la='eza -a --git'
    alias lf='eza -bgHliS'
    alias l='ll'
else
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls'
end