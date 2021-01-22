#!/bin/bash

ln -sf dotfiles/_vimrc ~/.vimrc
ln -sf dotfiles/_vim ~/.vim
ln -sf dotfiles/_tmux.conf ~/.tmux.conf
ln -sf dotfiles/_zshrc ~/.zshrc
ln -sf dotfiles/_oh-my-zsh ~/.oh-my-zsh

git submodule init
git submodule update

#install oh-my-zsh & plugins with submodule 

ln -sf ~/dotfiles/zsh-plugins/zsh-syntax-highlighting ~/dotfiles/_oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -sf ~/dotfiles/zsh-plugins/zsh-autosuggestions ~/dotfiles/_oh-my-zsh/custom/plugins/zsh-autosuggestions
ln -sf ~/dotfiles/zsh-plugins/zsh-completions ~/dotfiles/_oh-my-zsh/custom/plugins/zsh-completions
