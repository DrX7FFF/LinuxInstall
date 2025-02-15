## Linux
### Gestion des paquets

- Mise à jour des paquets :
  ```bash
  sudo apt update && sudo apt -y upgrade
  ```
  ```bash
  sudo apt dist-upgrade -y
  sudo apt autoremove
  ```
- Informations sur un package :
  ```bash
  apt info {package Name}
  ```
- Installation de modules supplémentaires :
  ```bash
  sudo apt-get install python-requests
  sudo apt-get install exfat-utils -y
  sudo apt-get install iperf3 -y
  sudo apt-get install imdb-tools
  ```

### Informations système

- Informations CPU :
  ```bash
  cat /proc/cpuinfo
  lscpu
  ```
- Version du Kernel :
  ```bash
  uname -a
  ```
- Charge CPU et uptime :
  https://linux.die.net/man/5/proc
  https://www.baeldung.com/linux/proc-meminfo
  ```bash
  uptime
  cat /proc/loadavg
  cat /proc/loadavg
  cat /proc/uptime
  cat /proc/meminfo
  ```
- Température CPU :
  (Doit être inférieur à 85°C)
  ```bash
  vcgencmd measure_temp
  ```
- Informations GPU :
  ```bash
  sudo lshw -C display
  vulkaninfo --summary
  glxinfo -B
  ```
- Type et verson distribution :
  https://www.malekal.com/comment-connaitre-version-linux/
  ```bash
  cat /etc/lsb-release
  ```
  Pour Debian :
  ```bash
  cat /etc/debian_version
  ```
  Pour CoreElec :
  https://discourse.coreelec.org/t/display-info/8425/5
  ```bash
  dispinfo
  /storage/.kodi/userdata/disp_cap
  ```

### Gestion des disques et des fichiers
- Rendre executable
  ```bash
  chmod +x *
  ```
- Recherche de fichiers :
  ```bash
  sudo find -iname "fichier.ext"
  sudo find / -not -path '/sys*' -not -path '/dev*' -not -path '/proc*' -mmin -10 -type f
  ```
- Afficher capacité des disques :
  ```bash
  df -h
  ```
- Afficher d'utilisation des dossiers :
  ```bash
  sudo du -hx / | sort -h
  ```
- Editer un disk
  ```bash
  sudo cfdisk /dev/sda
  ```  
- Formater un disque en ext4 :
  ```bash
  sudo mkfs.ext4 /dev/sda2
  ```
- Liste des disques et partitions :
  ```bash
  sudo lsblk
  sudo blkid
  sudo fdisk -l
  ```
- Liste des périphériques branchés en USB :
  ```bash
  sudo lsusb
  ```
- Diag de toute la chaine USB USB Hub USB1 USB2 high-speed USB3 SuperSpeed :
  ```bash
  dmesg | grep -i usb
  ```
- Tester débit écriture disque :
  ```bash
  dd if=/dev/zero of=/media/HD1/test bs=1M count=1000 oflag=direct
  ```
  résultat attentu 190MB/s c'est ok :
  1048576000 bytes (1000.0MB) copied, 5.285930 seconds, 189.2MB/s

- Tester débit lecture disque :
  ```bash
  dd if=/media/HD1/test of=/dev/null bs=1M count=1000
  ```
  résultat attentu 1.1GB/s c'est exceptionnel (surement grace au cache) :
  1048576000 bytes (1000.0MB) copied, 0.891628 seconds, 1.1GB/s


- Monter une partition :
  ```bash
  sudo mount -t auto /dev/sda1 /media/DATA
  sudo mount -t cifs //[IP]/[Partage] /mnt/[Dossier] -o guest
  sudo nano /etc/fstab
  sudo cat /etc/mtab
  ```
- Cloner un disque dur :
  ```bash
  sudo dd if=/dev/sda of=/dev/sdb bs=100M
  ```
- Supprimer un dossier récursivement sans validation :
  ```bash
  rm -rf <folder>
  ```

### Réseau
https://blog.stephane-robert.info/docs/admin-serveurs/linux/reseaux/
- Informations IP et DNS :
  ```bash
  ifconfig
  ip a
  resolvectl status
  sudo resolvectl statistics
  ```
  info réseau sous netplan
  ```bash
  sudo netplan status --all
  ```

  Pour afficher la liste des serveurs DNS et resolution d'un nom :
  ```bash
  cat /etc/resolv.conf
  nslookup example.com
  dig example.com
  sudo resolvectl flush-caches
  ```
  
  Vérifier parcours réseau (network path) :
  ```bash  
  tracepath -b www.google.com
  ```

  Vérifier les routes :
  ```bash  
  ip route | grep default # ou la vrai "commande" ip route show default
  ```
  https://www.it-connect.fr/linux-et-windows-comment-prioriser-une-route-ou-une-interface-pour-acceder-a-internet/

  Vérifier son adresse IP public
  ```bash  
  curl -v ipinfo.io/ip
  curl ifconfig.me
  ```
  
- Ports ouverts :
  ```bash
  netstat
  ```
- Tester un serveur avec iperf :
  ```bash
  sudo apt-get install iperf3
  sudo iperf3 -s
  sudo iperf3 -c [IPServer]
  ```

### Services

- Liste des services en cours :
  ```bash
  sudo systemctl --type=service --state=running
  ```
- Redémarrer un service Samba :
  ```bash
  sudo systemctl restart smbd.service
  ```
- Redémarrer un serveur FTP :
  ```bash
  sudo systemctl restart vsftpd.service
  ```

### Divers
  - Informations sur les périphériques 
  ```bash
  sudo lspci -v
  lspci -k | grep -EA3 'VGA|3D|Display' output:
  lspci -k | grep -EA3 'VGA|3D|Display'
  lspci -knnn | grep -A3 -E 'VGA|Display|3D'
  ```
  - Touver le chemin source d'un executable :
  ```bash
  which [executable]
  ```
  - Afficher l'heure système :
  ```bash
  timedatectl
  date
  ```
  - Autres commandes courantes :
  ```bash
  reboot
  halt
  ```
  - Générer clé SSH
  ```bash
  ssh-keygen -t rsa -b 4096 -C "Clé SSH HAB"
  ```
  - Démarrer l'AgentSSH
  ```bash
  eval "$(ssh-agent -s)"
  ```
  - Ajout clé SSH à l'AgentSSH
  ```bash
  ssh-add ~/.ssh/id_rsa
  ssh-add -l
  ```
  - Copier clé SSH sur le serveur distant :
  ```bash
  ssh-copy-id habadm@192.168.1.100
  ssh-copy-id root@192.168.1.102
  ```
  Puis se connecter en SSH pour valider et activer la clé SSH  
  - Operateurs bash :
https://kapeli.com/cheat_sheets/Bash_Test_Operators.docset/Contents/Resources/Documents/index

  Tuer un processus :
  ```bash
  ps -edf |grep [process_name]
  kill -9 [PID]
  ```

## Docker

### Gestion des containers
https://www.malekal.com/comment-lister-arreter-demarrer-un-conteneur-docker/
- Relancer les containers :
  ```bash
  docker compose down && docker compose up -d
  ```
- Lancer une commande dans un container :
  ```bash
  docker exec -it [container_name] /bin/bash
  ```

### Gestion des images
- Listes des container :
  ```bash
  docker ps -a
  ```
- Mise à jour des images :
  ```bash
  docker compose pull
  ```
- Purger les images inutiles (A faire qd les containers sont démarrés) :
  ```bash
  docker system prune -a -f
  ```
  ```bash
  docker image prune
  ```

### Logs

- Afficher les logs d'un container :
  ```bash
  docker logs [container_name]
  ```
### Network & diagnostique
  ```bash
  docker network ls
  docker network inspect <Network Name>
  docker stats
  docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
  docker inspect --format='{{json .State}}' httpdc
  docker stats --no-stream  --format "{{.CPUPerc}}" httpdc
  ```
https://devopssec.fr/article/fonctionnement-manipulation-reseau-docker
https://devopssec.fr/article/deboguer-vos-conteneurs-et-images-dockers
https://www.n0tes.fr/2019/05/11/Docker-et-IPtables/
---

## GIT
### Commandes de base

- Vérifier l'état :
  ```bash
  git status -s
  ```
- Ajouter des fichiers :
  ```bash
  git add [file1] [file2]
  ```
- Committer les modifications :
  ```bash
  git commit -a -m 'Message'
  ```
- Pousser vers le dépôt distant :
  ```bash
  git push
  ```
  ```bash
  git pull
  ```

## Divers
### Commandes Bash
  - AWK
  https://www.funix.org/fr/unix/awk.htm
  la fonction read permet une version plus simple de récupérer les informations mais ne permet pas de faire de traitement comme des calculs

### Armbian
  - Afficher le bandeau d'accueil :
  ```bash
  sudo /etc/update-motd.d/10-armbian-header && \
  sudo /etc/update-motd.d/30-armbian-sysinfo
  ```
  ```bash
  armbianmonitor
  ```
  
  - Modifier .gitignore :
  ```bash
  nano .gitignore
  ```
### Ubuntu
  - version bureau
  ```bash
  echo $XDG_SESSION_TYPE
  ```

### Sources utiles

- [Organisation des dossiers sous Linux](http://www.linux-france.org/article/sys/fichiers/fichiers-2.html)
- [Montage SMB](https://www.linode.com/docs/guides/linux-mount-smb-share/)

- Optimisation Raspberry Pi :
  [Lien vers les astuces](http://www.pihomeserver.fr/2013/06/17/raspberry-pi-home-server-techniques-doptimisation-de-votre-systeme/)
