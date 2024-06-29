#! /bin/bash

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
