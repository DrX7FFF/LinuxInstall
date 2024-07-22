#! /bin/bash

# Ubuntu 24.04

sudo apt update -y

sudo apt install -y curl

# Packet Manager
sudo apt install -y synaptic

# Ubuntu : Snap Store 
sudo snap refresh snap-store
sudo snap refresh

# Personalisation Gnome
sudo apt -y install dconf-editor
sudo apt -y install gnome-tweak-tool
sudo apt -y install gnome-tweaks

# Gestionnaire graphique firewall
sudo apt -y install gufw

# Outils réseau : ARP ...
sudo apt -y install net-tools
sudo apt -y install nmap
sudo apt -y install zenmap

# Python Installation PIP
sudo apt -y install python3-pip

# droit sur le port USB
sudo chmod a+rw /dev/ttyUSB0

# sudo apt -y install nautilus-actions