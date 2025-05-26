source $DOTFILES_PATH/fish/functions/setup_homebrew.fish

if [ -d /opt/homebrew ]
    setup_homebrew
end

alias wget="curl -O"
