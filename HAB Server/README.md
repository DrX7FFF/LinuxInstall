# Préparation carte SD
Télécharger image iso NanoPi Neo 2 (version Bleu) :
https://www.armbian.com/nanopi-neo-2/
> Minimal/IOT images with Armbian Linux v6.6  
> Build Date: Nov 12, 2024  
> Debian 12 (Bookworm)  

Restaurer l'image sur la carte SD

Copier les fichiers dans /root :
* .not_logged_in_yet
* setup.sh

# 1e connexion ssh root
```
ssh -l root 192.168.1.100
```
PWD : 1234  

si problème de clé ssh :
```
ssh-keygen -f '/home/moi/.ssh/known_hosts' -R '192.168.1.100'
```

modification PWD root + (pwd)  
création PWD habadm (pwd) 

Result :
```
    _             _    _                                         _ _        
   /_\  _ _ _ __ | |__(_)__ _ _ _    __ ___ _ __  _ __ _  _ _ _ (_) |_ _  _ 
  / _ \| '_| '  \| '_ \ / _` | ' \  / _/ _ \ '  \| '  \ || | ' \| |  _| || |
 /_/ \_\_| |_|_|_|_.__/_\__,_|_||_|_\__\___/_|_|_|_|_|_\_,_|_||_|_|\__|\_, |
                                 |___|                                 |__/ 
 v25.2 rolling for NanoPi Neo 2 running Armbian Linux 6.6.54-current-sunxi64

 Packages:     Debian stable (bookworm)
 Support:      for advanced users (rolling release)
 IP addresses: (LAN) IPv4: 192.168.1.100 IPv6: fe80::1:7aff:fec0:3c76 (WAN) 000.000.000.000

 Performance:  

 Load:         18%           	Up time:       8 min	
 Memory usage: 19% of 416M   	
 CPU temp:     41°C           	Usage of /:    8% of 15G    	

 Commands: 

 Configuration : armbian-config
 Monitoring    : htop
```

Installation :
```
chmod +x /root/setup.sh && ./setup.sh
```
```
reboot
```

# 1e connexion ssh habadm
```
ssh -l habadm 192.168.1.100
```

Login to Github :
```
gh auth login  
```

Clone de la conf docker :
```
git clone https://github.com/DrX7FFF/DockerHAB.git ~/docker
```
```
git config --global --add safe.directory ~/docker
```

> ~~mkdir -p ~/docker/nodered~~  
> ~~mkdir -p ~/docker/deconz~~  
> chown -R $USER:$USER ~/docker  
> chmod -R 777 ~/docker  


Ajouter COMPOSE_FILE dans Bash :
```
nano .bashrc  
```
Ajouter à la fin :
> export COMPOSE_FILE=/home/habadm/docker/compose.yaml

Démarrer les containers :
```
docker compose up -d
```

# Info interessantes
https://www.dzombak.com/blog/2021/11/Reducing-SD-Card-Wear-on-a-Raspberry-Pi-or-Armbian-Device.html  
https://forum.armbian.com/topic/11341-replace-ntp-with-chrony/

les logs system sont dans /run qui est tmpfs donc en RAM  
l'expension de la partition est automatique au 1e boot

# Notes
## Purge auto du log
https://stackoverflow.com/questions/42510002/how-to-clear-the-logs-properly-for-a-docker-container
sudo nano /etc/docker/daemon.json
	#ajout ou modif :
	{
	  "log-driver": "local",
	  "log-opts": {"max-size": "10m", "max-file": "3"}
	}

## Tester le dongle ConBee 2, vérifier que /dev/ttyACM0 est présent
```
ls -all /dev/ttyACM0  
```
~~droit pour accéder à la clé USB (Pas utile)~~  
~~sudo usermod -aG dialout $USER~~
