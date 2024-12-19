### info interessantes
# https://www.dzombak.com/blog/2021/11/Reducing-SD-Card-Wear-on-a-Raspberry-Pi-or-Armbian-Device.html
# https://forum.armbian.com/topic/11341-replace-ntp-with-chrony/
#
# les logs system sont dans /run qui est tmpfs donc en RAM
# l'expension de la partition est automatique au 1e boot

# Image NanoPi Neo 2 (Bleu)
https://www.armbian.com/nanopi-neo-2/
Minimal/IOT images with Armbian Linux v6.6
Build Date: Nov 12, 2024
Debian 12 (Bookworm)

# Restaurer l'image sur la carte SD

# Copier le fichier .not_logged_in_yet in /root/.not_logged_in_yet
# Copier le fichier setup.sh in /root/setup.sh

ssh -l root 192.168.1.100
PWD : 1234

# si problème de clé ssh :
ssh-keygen -f '/home/moi/.ssh/known_hosts' -R '192.168.1.100'

# modification PWD root EA@Adm
# création PWD habadm

#### Result
    _             _    _                                         _ _        
   /_\  _ _ _ __ | |__(_)__ _ _ _    __ ___ _ __  _ __ _  _ _ _ (_) |_ _  _ 
  / _ \| '_| '  \| '_ \ / _` | ' \  / _/ _ \ '  \| '  \ || | ' \| |  _| || |
 /_/ \_\_| |_|_|_|_.__/_\__,_|_||_|_\__\___/_|_|_|_|_|_\_,_|_||_|_|\__|\_, |
                                 |___|                                 |__/ 
 v25.2 rolling for NanoPi Neo 2 running Armbian Linux 6.6.54-current-sunxi64

 Packages:     Debian stable (bookworm)
 Support:      for advanced users (rolling release)
 IP addresses: (LAN) IPv4: 192.168.1.100 IPv6: fe80::1:7aff:fec0:3c76 (WAN) 176.136.10.173

 Performance:  

 Load:         18%           	Up time:       8 min	
 Memory usage: 19% of 416M   	
 CPU temp:     41°C           	Usage of /:    8% of 15G    	

 Commands: 

 Configuration : armbian-config
 Monitoring    : htop
#### Result

### Préparation
chmod +x /root/setup.sh
./setup.sh
reboot

# Mise à jour
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt autoremove

# Connecter avec nouveau compte 
ssh -l habadm 192.168.1.100

# git config --global user.name "DrX7FFF"
# git config --global user.email "dubourg.v@gmail.com"
# git config --global init.defaultBranch main
# git config --list

gh auth login

# Ajouter COMPOSE_FILE dans Bash
nano .bashrc
## A la fin
export COMPOSE_FILE=/home/habadm/docker/compose.yaml



### Commande GIT
git status
git add deconz/session.default deconz/zll.db nodered/context/global/global.json nodered/flows.json nodered/flows_cred.json 
nano .gitignore
git commit -a -m 'Sauvegarde'
git push
git pull

### Lien Firebase
https://console.firebase.google.com/project/hab-datalog/database/hab-datalog-default-rtdb/data

# Vérifier que ça fonctionne




# sudo mount -t tmpfs -o size=1m tmpfs /home/habadm/docker/deconz.ram
sudo nano /etc/fstab
# ajouter
deconzram /home/habadm/docker/deconz.ram tmpfs  defaults,size=1m 0 0
###

# cp -p -f -R /home/habadm/docker/deconz/* /home/habadm/docker/deconz.ram


# Tester le dongle ConBee 2, vérifier que /dev/ttyACM0 est présent
ls -all /dev/ttyACM0
# droit pour accéder à la clé USB (Pas utile)
# sudo usermod -aG dialout $USER



---------

## Purge auto du log
# https://stackoverflow.com/questions/42510002/how-to-clear-the-logs-properly-for-a-docker-container
sudo nano /etc/docker/daemon.json
	#ajout ou modif :
	{
	  "log-driver": "local",
	  "log-opts": {"max-size": "10m", "max-file": "3"}
	}