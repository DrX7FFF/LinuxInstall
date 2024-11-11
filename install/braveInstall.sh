#! /bin/bash

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# Reouvrir la session pour le 1e Démarrage
# Reouvrir la session après avoir paramétré la synchronisation

# pour pouvoir gérer les extension Gnome avec Brave
sudo apt install -y chrome-gnome-shell