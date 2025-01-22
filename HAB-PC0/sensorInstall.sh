
# https://www.cyberciti.biz/faq/install-sensors-lm-sensors-on-ubuntu-debian-linux/
# https://www.cyberciti.biz/faq/how-to-check-cpu-temperature-on-ubuntu-linux/
# https://wiki.archlinux.org/title/Lm_sensors
# https://github.com/UshakovVasilii/gnome-shell-extension-freon

sudo apt install -y lm-sensors

# Non utile car utilisation de l'extention Freon
#sudo apt install -y psensor

# Non compatible Ubuntu 24.04
#sudo apt install -y hddtemp

sudo sensors-detect --auto
sudo systemctl restart kmod

# Extension Gnome depuis un navigateur WEB
# https://extensions.gnome.org/extension/841/freon/

# Lire information DIMM (mémoire)
# sudo apt install -y i2c-tools
# modprobe i2c_dev

sudo tee /etc/sensors.d/myconf > /dev/null <<EOL 
chip "amdgpu-pci-c500"
    label temp1 "GPU"

chip "k10temp-pci-00c3"
    label temp1 "CPU"

chip "iwlwifi_1-virtual-0"
    label temp1 "WiFi"

chip "nvme-pci-0100"
    label temp1 "Disk"
EOL
