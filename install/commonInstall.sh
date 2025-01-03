#! /bin/bash

# Ubuntu 24.04
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y
#sudo apt update -y

sudo apt install -y curl

# Packet Manager
sudo apt install -y synaptic

# Ubuntu : Snap Store 
sudo snap refresh snap-store
sudo snap refresh

# Gestionnaire graphique firewall
sudo apt -y install gufw

# Outils réseau : ARP ...
sudo apt -y install net-tools
sudo apt -y install nmap
sudo apt -y install zenmap
sudo apt -y install iperf3

# Inxi https://www.linuxtricks.fr/wiki/inxi-un-script-complet-d-informations-systeme
sudo apt -y install inxi

# Python Installation PIP
sudo apt -y install python3-pip

# Outil de purge des PPA proprement et vérifie qu'il n'y a pas de packet en référence
sudo apt -y install ppa-purge

# droit sur le port USB
sudo chmod a+rw /dev/ttyUSB0

# Gestion logitech
#sudo apt -y install logiops

# traitement basic d'images
#sudo apt -y install gthumb

# utilisation des derniers drivers vidéo GPU
sudo add-apt-repository ppa:oibaf/graphics-drivers && apt update -y && apt -y upgrade

# Outils pour avoir les informations GPU : glxinfo
sudo apt -y install libvulkan1 mesa-vulkan-drivers vulkan-utils
sudo apt -y install mesa-utils
sudo apt -y install vulkan-tools
# drivers 386 pas de changement 
# sudo apt -y install libgl1-mesa-dri:i386
# sudo apt -y install mesa-vulkan-drivers 
# sudo apt -y install mesa-vulkan-drivers:i386


### Complément pour Fusion 360
# Samba
sudo apt -y install samba
# accéder aux ressources partagées sur des serveurs Windows
sudo apt -y install winbind


### Configuration de Gnome Ubuntu
# Personalisation Gnome
# sudo apt -y install nautilus-actions
sudo apt -y install dconf-editor
sudo apt -y install gnome-tweak-tool
sudo apt -y install gnome-tweaks
# Ajout du preview sur le Dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
# Retarder la détection application qui ne répond pas
# gsettings set org.gnome.mutter check-alive-timeout 60000