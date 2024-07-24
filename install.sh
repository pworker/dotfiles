#!/bin/bash

git submodule init
git submodule update

ln -sf dotfiles/_vimrc ~/.vimrc
ln -sf dotfiles/_vim ~/.vim
ln -sf dotfiles/_tmux.conf ~/.tmux.conf
ln -sf dotfiles/_zshrc ~/.zshrc
ln -sf dotfiles/ohmyzsh ~/.ohmyzsh

#Alacritty
  #Theme
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
  #Config
ln -sf ~/dotfiles/alacritty.toml ~/.config/alacritty


#install oh-my-zsh & plugins with submodule 

ln -sf ~/dotfiles/zsh-plugins/zsh-syntax-highlighting ~/dotfiles/ohmyzsh/custom/plugins/zsh-syntax-highlighting
ln -sf ~/dotfiles/zsh-plugins/zsh-autosuggestions ~/dotfiles/ohmyzsh/custom/plugins/zsh-autosuggestions
ln -sf ~/dotfiles/zsh-plugins/zsh-completions ~/dotfiles/ohmyzsh/custom/plugins/zsh-completions






