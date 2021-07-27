#!/usr/bin/env bash

# Install ZSH
sudo apt-get update
sudo apt-get install -y vim zsh nano shopt
sudo chsh -s /bin/zsh $USER

# Install and configure Oh My ZSH (if it is not already installed)
if [ -d "/home/coder/.oh-my-zsh" ] 
then
    echo "oh-my-zsh is already installed" 
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    # Append zshrc stuff to end of file
    touch ~/.zshrc # not sure if this will always exist at this point :/
    cat .zshrc >> ~/.zshrc
fi

# copy dotfiles into ~
/bin/bash shopt -s dotglob # include . in *
/bin/bash shopt -s extglob
/bin/bash yes | /bin/bash cp -rf ~/dotfiles/!(.git|.zshrc|.|..|.local) ~

