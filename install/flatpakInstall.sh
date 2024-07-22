#! /bin/bash

## installation Flatpak
# https://flatpak.org/setup/Ubuntu
sudo apt install -y flatpak
sudo apt install -y gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
