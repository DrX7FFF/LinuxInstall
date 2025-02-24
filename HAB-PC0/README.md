# Installation PC

## A activer
Activer FireWall
(?) Activer TimeShift : Quotidienne sur 5J

## Installer depuis la logitèque (Paquet système sont moins volumineux mais pas isolés):
- Meld
- VLC
- Hardinfo

## Installer avec des AppImages
- DB_Browser_for_SQLite-v3.12.2-x86_64

- OrcaSlicer_Linux_V2.0.0
  https://github.com/SoftFever/OrcaSlicer/releases/latest/download/package.zip
  https://github.com/SoftFever/OrcaSlicer/releases/download/v2.1.1/OrcaSlicer_Linux_V2.1.1.AppImage

- balenaEtcher-1.18.11-x64


## Installer extension Gnome : 
# https://extensions.gnome.org/local/
https://extensions.gnome.org/extension/5177/vertical-workspaces/
https://extensions.gnome.org/extension/841/freon/


# Notes

## Exemple de Desktop entry pour des AppImage
[Desktop Entry]
Name=GravitDesigner
Exec=/home/<path-to-folder>/GravitDesigner.AppImage
Type=Application

## Divers
- chemin d'enregistrement des applications :
  /home/moi/.var/app/

- Chemin des raccourcis Snap :
  /var/lib/snapd/desktop/applications

- Installation driver Vulkan AMD Ubuntu :  
  https://linuxconfig.org/install-and-test-vulkan-on-linux
  https://linuxconfig.org/improve-your-wine-gaming-on-linux-with-dxvk
  # Si retour arrière 
  sudo apt-get install ppa-purge
  sudo ppa-purge ppa:oibaf/graphics-drivers
  # Si pas suffisant 
  sudo add-apt-repository --remove ppa:appimagelauncher-team/stable

## Fusion 360
# Installation manuelle de FireFox
# https://support.mozilla.org/fr/kb/installer-firefox-linux
sudo apt-get -y purge firefox
sudo install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nL’empreinte numérique de la clé correspond ("$0").\n"; else print "\nÉchec de vérification de la clé : l’empreinte ("$0") ne correspond pas à celle attendue.\n"}'
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

# section en 1 fois les lignes suivantes
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla
# fin section

sudo apt update && sudo apt install firefox
sudo apt install firefox-l10n-fr

# Installation Fusion
mkdir -p "$HOME/.fusion360/bin" && cd "$HOME/.fusion360/bin" && wget -N https://raw.githubusercontent.com/cryinkfly/Autodesk-Fusion-360-for-Linux/main/files/builds/stable-branch/bin/install.sh && chmod +x install.sh && ./install.sh

# Demarrage
/home/moi/.fusion360/wineprefixes/default/box-run.sh

# Kill à la fermerture :
kill -9 $(ps aux |grep -i '\.exe' |awk '{print $2}'|tr '\n' ' ')

## Input Remapper
# https://medium.com/@canadaduane/key-remapping-in-linux-2021-edition-47320999d2aa
# https://github.com/sezanzeb/input-remapper
git clone https://github.com/sezanzeb/input-remapper.git
cd input-remapper && ./scripts/build.sh
sudo apt install -f ./dist/input-remapper-2.0.1.deb
sudo apt install git python3-setuptools gettext

https://unix.stackexchange.com/questions/326373/configure-extra-mouse-button-as-a-second-middle-click-under-wayland
https://github.com/PixlOne/logiops
https://wiki.archlinux.org/title/Logitech_MX_Master


## AppImageLauncher
# https://github.com/TheAssassin/AppImageLauncher
./appimagelauncher-lite* install

## Gestion boot
### Version simple
```bash
sudo add-apt-repository ppa:yannubuntu/boot-repair \
sudo apt update \
sudo apt install boot-repair \
```
### Version de paramétrage
```bash
sudo add-apt-repository ppa:danielrichter2007/grub-customizer \
sudo apt update \
sudo apt install grub-customizer \
```

# Plus utile

## Bottle
- chemin d'enregistrement des bottles :
/home/moi/.var/app/com.usebottles.bottles/data/bottles/bottles
- Commande pour lanceur :
flatpak run --command=bottles-cli com.usebottles.bottles run -b MyNotePad++ -p notepad++
flatpak run --command=bottles-cli com.usebottles.bottles run -b NomDeLaBouteille -p ProgrammeDansLaBouteille 


## Benchmark disque dur
KDiskMark : https://github.com/JonMagon/KDiskMark

## Gestion Logitech
- Solaar ou Piper ou logiops 
  Piper ne fonctionne pas avec Fusion  
  logiops difficile à paramétrer  
  Solaar ne semble pas fonctionner avec Fusion  

## NotePad Next
https://github.com/dail8859/NotepadNext/releases

## Creation usb iso
sudo apt install -y usb-creator-gtk

## NotePadQQ
# Pas maintenu

## Pour TinyMediaManager
Download from https://www.tinymediamanager.org/download/
Extract in "~/Programs" folder
install libmediainfo
    https://mediaarea.net/en/MediaInfo/Download/Ubuntu
apt install mediainfo-gui
apt install mediainfo

## LinuxMint 21.3 Cinnamon

## Addon Applets Cinnamon :
* Cinnamenu
* Indicateur touches de verrouillage
* Power profiles

# Gestionnaire de profile alimentation et performance
# power-profiles-daemon
$ powerprofilesctl

#  Désactiver application au démarrage
# Pour afficher toutes les applications masquès
$ sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop
evolution
mintwelcome
Relevés du système
sticky notes
warpinator
mintreport
