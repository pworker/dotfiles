#!/bin/bash

git submodule init
git submodule update

ln -sf ~/dotfiles/_vimrc ~/.vimrc
ln -sf ~/dotfiles/_vim ~/.vim
ln -sf ~/dotfiles/_tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/_zshrc ~/.zshrc

ln -sf ~/dotfiles/nvim ~/.config/nvim

#Alacritty
#Theme
#mkdir -p ~/.config/alacritty/themes
#git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
#Config
ln -sf ~/dotfiles/alacritty.toml ~/.config/alacritty

if [[ "$OSTYPE" == "darwin"* ]]; then
  #shkd
  mkdir -p ~/.config/skhd
  ln -sf ~/dotfiles/osx/skhdrc ~/.config/skhd/skhdrc
  #yabai
  mkdir -p ~/.config/yabai
  ln -sf ~/dotfiles/osx/yabairc ~/.config/yabai/yabairc
  #sketchybarrc
  mkdir -p ~/.config/sketchybar/
  ln -sf ~/dotfiles/osx/sketchybarrc ~/.config/sketchybar/sketchybarrc
fi

#install oh-my-zsh & plugins
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/dotfiles/ohmyzsh
ln -sf ~/dotfiles/ohmyzsh ~/.ohmyzsh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/dotfiles/zsh-plugins/zsh-syntax-highlightingt
ln -sf ~/dotfiles/zsh-plugins/zsh-syntax-highlighting ~/dotfiles/ohmyzsh/custom/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/dotfiles/zsh-plugins/zsh-autosuggestions
ln -sf ~/dotfiles/zsh-plugins/zsh-autosuggestions ~/dotfiles/ohmyzsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-completions.git ~/dotfiles/zsh-plugins/zsh-completions
ln -sf ~/dotfiles/zsh-plugins/zsh-completions ~/dotfiles/ohmyzsh/custom/plugins/zsh-completions
