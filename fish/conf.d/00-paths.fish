# Repository path
export REPOS="$HOME/Repos"

# Base dotfiles repository path
export DOTFILES_PATH="$HOME/Repos/env/dotfiles"

if [ -d "/usr/local/bin" ]
    fish_add_path "/usr/local/bin"
end

if [ -d "$HOME/.bin" ]
    fish_add_path "$HOME/.bin"
end

if [ -d "$HOME/.local/bin" ]
    fish_add_path "$HOME/.local/bin"
end