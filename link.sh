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
  ln -s $(pwd)/local/share/applications ~/.local/share/applications
fi