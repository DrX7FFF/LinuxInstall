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

---

## Docker

### Gestion des containers

- Relancer les containers :
  ```bash
  docker compose down && docker compose up -d
  ```
- Lancer une commande dans un container :
  ```bash
  docker exec -it [container_name] /bin/bash
  ```

### Gestion des images

- Mise à jour des images :
  ```bash
  docker compose pull
  ```
- Purger les images inutiles (A faire qd les containers sont démarrés) :
  ```bash
  docker system prune -a
  ```
  ```bash
  docker image prune
  ```

### Logs

- Afficher les logs d'un container :
  ```bash
  docker logs [container_name]
  ```

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
