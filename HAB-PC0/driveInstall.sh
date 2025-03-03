#! /bin/bash

#### GoogleDrive
## https://github.com/astrada/google-drive-ocamlfuse
# Paramétrage de l'API Google pour l'authentification OAuth2 à faire 1 fois
# Nom = DroitGDriveLinux
# https://console.cloud.google.com/apis/credentials?project=droitgdrive
# Nouvelle Methode
# https://github.com/astrada/google-drive-ocamlfuse/issues/764


## Montage automatique via un service, chapitre Mount using systemd :
## Attention pour l'utilisation du Label, il faut le faire avec la création du fichier de configuration (-id -secret)
## https://github.com/astrada/google-drive-ocamlfuse/wiki/Automounting#mount-using-systemd

## Monter manuellement
# google-drive-ocamlfuse ~/GoogleDrive
## Démonter manuellement
# fusermount -u ~/GoogleDrive
## Démarrer/Arrêter le service
# sudo systemctl start google-drive.service
# sudo systemctl stop google-drive.service
# sudo systemctl restart google-drive.service

# reprendre le fichier de configuration
# /home/moi/.gdfuse/default/config
# A modifier :
# background_folder_fetching. If set to a true (the default is false), it starts a thread to fetch folder data in background.


sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt update -y
sudo apt install -y google-drive-ocamlfuse
mkdir ~/GoogleDrive

echo "[Unit]
Description=FUSE filesystem over Google Drive
After=network.target

[Service]
User=moi
ExecStart=google-drive-ocamlfuse /home/moi/GoogleDrive
ExecStop=fusermount -u /home/moi/GoogleDrive
Restart=always
Type=forking

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/google-drive.service

sudo systemctl enable google-drive.service
