#! /bin/bash

# Ubuntu 24.04
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y


# outil CURL
sudo apt install -y curl


# outil Git
sudo apt install -y git
# paramétrage GIT
git config --global user.name "DrX7FFF"
git config --global user.email "dubourg.v@gmail.com"
git config --global init.defaultBranch main
mkdir -p ~/GIT

# outil GH GitHub
sudo apt install -y gh

# Packet Manager
sudo apt install -y synaptic


# Shell ZSH (https://www.youtube.com/watch?v=l-aPNBG1WVk)
sudo apt -y install zsh
# création fichier de configuration vide pour éviter de lancer zsh-newuser-install
touch ~/.zshrc
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
# redémarrage de zsh
# source ~/.zshrc

# Installe la font UbuntuMonoNerdFontMono-Regular.ttf pour le shell (https://www.nerdfonts.com/)
mkdir -p ~/.local/share/fonts
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/UbuntuMono.tar.xz | tar -xJf - --wildcards --no-anchored 'UbuntuMonoNerdFontMono-Regular.ttf' -O > ~/.local/share/fonts/UbuntuMonoNerdFontMono-Regular.ttf
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz | tar -xJf - --wildcards --no-anchored 'UbuntuMonoNerdFontMono-Regular.ttf' -O > ~/.local/share/fonts/UbuntuMonoNerdFontMono-Regular.ttf
fc-cache -fv

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

# autre
sudo apt -y install nfs-common
sudo apt -y install cifs-utils

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

# Gestion logitech
#sudo apt -y install logiops

# traitement basic d'images
#sudo apt -y install gthumb

# Outil de gestion des médias
sudo apt install ffmpeg