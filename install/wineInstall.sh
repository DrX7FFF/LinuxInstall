#! /bin/bash

sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt -y update
sudo apt install --install-recommends winehq-staging
sudo apt install winetricks
# sudo apt install yad

# wget -O ~/Téléchargements/WineGUI.deb https://winegui.melroy.org/downloads/WineGUI-v2.5.0.deb
# sudo apt install ~/Téléchargements/WineGUI.deb