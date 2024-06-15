#! /bin/bash

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
