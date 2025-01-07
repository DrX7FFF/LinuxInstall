#! /bin/bash

USER_NAME="habadm"

echo "### update & upgrade ###"
apt -qq update
apt -y -qq upgrade

echo "### set name ###"
# echo 'habserver' > /etc/hostname
hostnamectl set-hostname habserver

echo "### Disable WPA WiFi service ###"
systemctl stop wpa_supplicant.service
systemctl disable wpa_supplicant.service


echo "### Relace timesyncd by chrony (reduce SD card wear) ###"
systemctl stop systemd-timesyncd
systemctl disable systemd-timesyncd
apt -y -qq install chrony


echo "### Prepare dockers RAM folders ###"
mkdir -p /home/$USER_NAME/docker.ram
chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/docker.ram
chmod -R 777 /home/$USER_NAME/docker.ram

echo "### Check in dockers RAM automount in /etc/fstab ###"
if ! grep -q "/home/$USER_NAME/docker.ram" /etc/fstab; then
  echo "### Add RAM automount in /etc/fstab ###"
  echo "tmpfs /home/$USER_NAME/docker.ram tmpfs defaults,noatime,size=1m 0 0" >> /etc/fstab

  echo "### Mount docker RAM folders ###"
  mount /home/$USER_NAME/docker.ram
fi

echo "### Create service : Copy Deconz parameters files to RAM ###"
tee /etc/systemd/system/deconzramcopy.service > /dev/null <<EOL 
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

systemctl daemon-reload
systemctl enable deconzramcopy.service
#systemctl start deconzramcopy.service


echo "### Install Docker ###"
armbian-config --cmd CON001
systemctl enable docker
usermod -aG docker $USER_NAME
apt -y -qq install docker-compose-plugin

# Log to journald https://docs.docker.com/engine/logging/drivers/journald/
DOCKER_MAIN_CONFIG="/etc/docker/daemon.json"
TEMP_CONFIG="/tmp/docker_temp_config.json"
if [ ! -f "$DOCKER_MAIN_CONFIG" ]; then
    echo "{}" | tee "$DOCKER_MAIN_CONFIG" > /dev/null
fi
jq '. * {"log-driver": "journald"}' "$DOCKER_MAIN_CONFIG" | tee "$TEMP_CONFIG" > /dev/null
mv "$TEMP_CONFIG" "$DOCKER_MAIN_CONFIG"

echo "### Check default compose files ###"
if ! grep -qE --regexp="^\s*export\s+COMPOSE_FILE\s*=" /home/$USER_NAME/.bashrc; then
  echo "### Add default compose files in /home/$USER_NAME/.bashrc ###"
  echo "export COMPOSE_FILE=/home/$USER_NAME/docker/compose.yaml" >> /home/$USER_NAME/.bashrc
fi


# echo "### Disable kernel auto update ###"
# armbian-config --cmd SY002


echo "### Install GIT + config ###"
apt -y -qq install git


echo "### Install GitHub client gh ###"
apt -y -qq install wget
mkdir -p -m 755 /etc/apt/keyrings
wget -q -O /etc/apt/keyrings/githubcli-archive-keyring.gpg https://cli.github.com/packages/githubcli-archive-keyring.gpg
chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt -qq update
apt -y -qq install gh


echo "##### Check #####"

echo "### Chrony ###"
chronyc sources
chronyc tracking
timedatectl

echo "### deconzramcopy.service ###"
systemctl status deconzramcopy.service

echo "### USB ConBee 2 ###"
ls -all /dev/ttyACM0
