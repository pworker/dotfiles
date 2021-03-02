#!/bin/bash

ln -sf dotfiles/_vimrc ~/.vimrc
ln -sf dotfiles/_vim ~/.vim
ln -sf dotfiles/_tmux.conf ~/.tmux.conf
ln -sf dotfiles/_zshrc ~/.zshrc
ln -sf dotfiles/ohmyzsh ~/.ohmyzsh

git submodule init
git submodule update

#install oh-my-zsh & plugins with submodule 

ln -sf ~/dotfiles/zsh-plugins/zsh-syntax-highlighting ~/dotfiles/ohmyzsh/custom/plugins/zsh-syntax-highlighting
ln -sf ~/dotfiles/zsh-plugins/zsh-autosuggestions ~/dotfiles/ohmyzsh/custom/plugins/zsh-autosuggestions
ln -sf ~/dotfiles/zsh-plugins/zsh-completions ~/dotfiles/ohmyzsh/custom/plugins/zsh-completions
