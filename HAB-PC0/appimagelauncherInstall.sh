#! /bin/bash


#### Ne fonctionne pas 
## Pas utile
## sudo apt install software-properties-common

## sudo add-apt-repository ppa:appimagelauncher-team/stable
# sudo add-apt-repository ppa:appimagelauncher-team/daily
# sudo apt -y update
# sudo apt -y install appimagelauncher
####

### Nouvelle méthode depuis Debian
# Install Fusev2 for Appimage
sudo apt install libfuse2t64 -y

# Download the pre-compiled .deb build
wget -O appimagelauncher.deb https://github.com/TheAssassin/AppImageLauncher/releases/download/continuous/appimagelauncher_2.2.0-gha111.d9d4c73+bionic_amd64.deb

# Install the .deb build
sudo dpkg -i appimagelauncher.deb

# Fix missing system dependencies
sudo apt --fix-broken install -y

# May also be needed
sudo systemctl restart systemd-binfmt