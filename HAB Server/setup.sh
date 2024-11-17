#! /bin/bash

USER_NAME="habadm"

echo "### update & upgrade ###"
apt -qq update
apt -y -qq upgrade


echo "### Disable WPA WiFi service ###"
systemctl stop wpa_supplicant.service
systemctl disable wpa_supplicant.service


echo "### Relace timesyncd by chrony (reduce SD card wear) ###"
systemctl stop systemd-timesyncd
systemctl disable systemd-timesyncd
apt -y -qq install chrony


### Préparation dossiers dockers
mkdir -p /home/$USER_NAME/docker/nodered
mkdir -p /home/$USER_NAME/docker/deconz
chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/docker
chmod -R 777 /home/$USER_NAME/docker

# Repertoire RAM Docker pour deconz
mkdir -p ~/docker.ram/deconz
chown -R $USER_NAME:$USER_NAME ~/docker.ram
sudo chmod -R 777 ~/docker.ram

# Ajouter le point de montage si non présent dans /etc/fstab
if ! grep -q "/home/$USER_NAME/docker.ram" /etc/fstab; then
  # Ajouter l'entrée tmpfs à /etc/fstab
  echo "tmpfs /home/$USER_NAME/docker.ram tmpfs defaults,noatime,size=1m 0 0" >> /etc/fstab

  # et Monter immédiatement
  mount $MOUNT_POINT
fi

# Service de copie de deconz
sudo tee /etc/systemd/system/deconzramcopy.service > /dev/null <<EOL 
[Unit]
Description=Copy Deconz parameters files to RAM
After=home-$USER_NAME-docker-deconz.ram.mount
Before=containerd.service

[Service]
Type=oneshot
RemainAfterExit=yes
Restart=no
ExecStart=cp -RT /home/$USER_NAME/docker/deconz /home/$USER_NAME/docker.ram/deconz

[Install]
WantedBy=default.target
EOL

sudo systemctl daemon-reload
sudo systemctl enable deconzramcopy.service
#sudo systemctl start deconzramcopy.service

# Installation Docker
armbian-config --cmd CON001
systemctl enable docker
usermod -aG docker $USER_NAME
apt-get install docker-compose-plugin

# désactiver mise à jour du kernel qui peut tout faire planter
armbian-config --cmd SY002

# control
chronyc sources
chronyc tracking
timedatectl
systemctl status deconzramcopy.service
ls -all /dev/ttyACM0