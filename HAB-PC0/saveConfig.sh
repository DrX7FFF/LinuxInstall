#! /bin/bash

mkdir -p ./config
mkdir -p ./config/ssh

# Ubuntu 24.04
dconf dump / > ./config/gnome_settings.dconf
cp ~/.zshrc ./config/.zshrc
cp -r ~/.oh-my-zsh ./config/.oh-my-zsh
cp ~/.ssh/config ./config/ssh/config

# restore with
# dconf load -f / < saved_settings.dconf