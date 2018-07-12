#!/bin/bash

ln -s $(pwd)/gitconfig ~/.gitconfig
ln -s $(pwd)/gitignore ~/.gitignore
ln -s $(pwd)/atom ~/.atom
ln -s $(pwd)/synergy/$(hostname) ~/.synergys

rm -fr ~/.zshrc ~/.oh-my-zsh/custom
ln -s $(pwd)/ohmyzsh ~/.oh-my-zsh/custom
ln -s $(pwd)/zshrc ~/.zshrc

ln -s $(pwd)/xsendkeysrc ~/.xsendkeysrc

if [ uname --all | grep -E '(Ubuntu|Fedora|Mint)' ]; then
  rm -r ~/.local/share/applications
  ln -s $(pwd)/gnome/local/share/applications ~/.local/share/applications

  rm -r ~/.config/autostart
  ln -s $(pwd)/gnome/config/autostart ~/.config/autostart
fi

if [ -d "$HOME/.nvm" ]; then
  ln -s $(pwd)/nvm.default-packages ~/.nvm/default-packages
fi

