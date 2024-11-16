# Image NanoPi Neo 2 (Bleu)
https://www.armbian.com/nanopi-neo-2/
Minimal/IOT images with Armbian Linux v6.6
Build Date: Nov 12, 2024
Debian 12 (Bookworm)

# Restaurer l'image sur la carte SD
# l'expension de la partition est automatique au 1e boot

# Copier le fichier .not_logged_in_yet in /root/.not_logged_in_yet

ssh -l root 192.168.1.100
PWD : 1234

# problème de clé ssh :
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
apt update
apt -y upgrade
reboot

# Connecter avec nouveau compte 
ssh -l habadm 192.168.1.100

# Rien à modifier dans armbian-config
# armbian-config

### Préparation dossiers dockers
mkdir -p ~/docker/nodered
mkdir -p ~/docker/deconz
sudo chown -R $USER:$USER ~/docker/nodered
sudo chmod -R 777 ~/docker/nodered

### Installation Docker
# Voir différence en Minimal et Engine
# armbian-config --cmd CON002
armbian-config --cmd CON001
sudo systemctl enable docker
sudo usermod -aG docker $USER
sudo reboot

sudo apt-get install docker-compose-plugin

# Tester le dongle ConBee 2, vérifier que /dev/ttyACM0 est présent
ls -all /dev/tty*
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