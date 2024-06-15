#! /bin/bash
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
	| gpg --dearmor \
	| sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
	| sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt -y update
sudo apt install -y codium

## Modules python pour PlatformIO
sudo apt install -y python3-venv

# Utile si Python < 3.12
sudo apt install -y python3-distutils  

