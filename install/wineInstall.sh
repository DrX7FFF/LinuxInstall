#! /bin/bash

## Wine install Ubuntu 24.04 Nobble Numbat
# https://wiki.winehq.org/Ubuntu

# Enable 32 bit architecture
sudo dpkg --add-architecture i386

# Download and add the repository key
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

# Define source file for Ubuntu 24.04
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
# Define source file for Mint
# sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt -y update

# installationStable branch
#sudo apt install --install-recommends winehq-stable
# installation version Staging
sudo apt install --install-recommends winehq-staging
# installation version Devel
# sudo apt install -y --install-recommends winehq-devel

# installation WineTricks
sudo apt -y install winetricks
# sudo apt install yad

# wget -O ~/Téléchargements/WineGUI.deb https://winegui.melroy.org/downloads/WineGUI-v2.5.0.deb
# sudo apt install ~/Téléchargements/WineGUI.deb
