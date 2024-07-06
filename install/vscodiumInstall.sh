#! /bin/bash

## VSCodium
# https://vscodium.com/#install-on-debian-ubuntu-deb-package

## Ajout des modules C++ et platformIO
# https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools
# https://marketplace.visualstudio.com/items?itemName=platformio.platformio-ide
# https://marketplace.visualstudio.com/items?itemName=alexnesnes.teleplot
# Open extension in the Microsoft Marketplace following the link above
# Download extension's VSIX file by clicking on "Download Extension" in "Resources" section (right sidebar)
# Navigate to VSCodium Extensions view and click "...", select "Install from ".VSIX".
# Restart VSCodium.



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
# sudo apt install -y python3-distutils  

