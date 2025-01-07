# Préparation carte SD
Télécharger image iso NanoPi Neo 2 (version Bleu) :
https://www.armbian.com/nanopi-neo-2/
> Minimal/IOT images with Armbian Linux v6.6  
> Build Date: Nov 12, 2024  
> Debian 12 (Bookworm)  

Restaurer l'image sur la carte SD

Copier les fichiers dans /root (attention au nom des fichiers qui peuvent changer durant le téléchargement) :
* .not_logged_in_yet
* setup.sh

# 1e connexion ssh root
Effacer les clé ssh locales existantes :
```
ssh-keygen -f '/home/moi/.ssh/known_hosts' -R '192.168.1.100'
```
```
ssh -l root 192.168.1.100
```
PWD : 1234  
  
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
chmod +x ./setup.sh && ./setup.sh
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
git config --global user.name "DrX7FFF" && \
git config --global user.email "dubourg.v@gmail.com" && \
git config --global init.defaultBranch main
```
```
gh auth login
```

Clone de la conf docker :
```
git clone https://github.com/DrX7FFF/DockerHAB.git ~/docker
```
> ~~git config --global --add safe.directory ~/docker~~

> ~~chown -R $USER:$USER ~/docker~~  
> ~~chmod -R 777 ~/docker~~  

Relancer la copie de la conf de deconz :
```
sudo systemctl restart deconzramcopy.service
```

Démarrer les containers :
```
docker compose up -d
```
Réinstaller 1 élément de la palette (Tous les éléments sont réinstallés)  
Relancer les containers :
```
docker compose down && docker compose up -d
```
Reconnecter Node Deconz au serveur Deconz  

Récupérer clé privée firebase :  
https://console.firebase.google.com/u/0/project/hab-datalog/settings/serviceaccounts/adminsdk  
Générer une nouvelle clé privée

Reparamétrer Node configuration FireBase :
- Connexion - Type = clé privé JSON  
- Sécurité = Glisser le fichier de la clé privée
- Base de données = https://hab-datalog-default-rtdb.europe-west1.firebasedatabase.app/  


Sauvegarde de la conf de deconz :
```
cp -f ~/docker.ram/deconz/zll.db ~/docker.ram/deconz/session.default ~/docker.ram/deconz/config.ini ~/docker/deconz
```
```
git commit -a -m 'Sauvegarde suite réinstallation' && git push
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
