## 2. Commandes Linux

### Gestion des paquets

- Mise à jour des paquets :
  ```bash
  sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y
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
  ```bash
  uptime
  cat /proc/loadavg
  ```
- Température CPU :
  ```bash
  vcgencmd measure_temp
  ```
- Informations GPU :
  ```bash
  sudo lshw -C display
  vulkaninfo --summary
  glxinfo -B
  ```
- Version Debian :
  ```bash
  cat /etc/debian_version
  ```

### Gestion des disques et des fichiers

- Recherche de fichiers :
  ```bash
  sudo find -iname "fichier.ext"
  sudo find / -not -path '/sys*' -not -path '/dev*' -not -path '/proc*' -mmin -10 -type f
  ```
- Afficher le taux d'utilisation des disques :
  ```bash
  df -h
  ```
- Formater un disque en ext4 :
  ```bash
  sudo mkfs.ext4 /dev/sda2
  ```
- Liste des disques et partitions :
  ```bash
  sudo lsblk
  sudo blkid
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
- Supprimer un dossier récursivement :
  ```bash
  rm -rf <folder>
  ```

### Réseau

- Informations IP et DNS :
  ```bash
  ip a
  resolvectl status
  cat /etc/resolv.conf
  nslookup <nom_de_domaine>
  sudo resolvectl flush-caches
  ```
- Ports ouverts :
  ```bash
  netstat
  ```
- Tester un serveur avec iperf :
  ```bash
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

- Afficher l'heure système :
  ```bash
  timedatectl
  date
  ```
- Autres commandes courantes :
  ```bash
  ifconfig
  reboot
  halt
  nano
  sudo passwd root
  ```

---

## 3. Docker

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
- Purger les images inutiles :
  ```bash
  docker system prune -a
  docker image prune
  ```

### Logs

- Afficher les logs d'un container :
  ```bash
  docker logs [container_name]
  ```

---

## 4. Git

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

### Gestion des fichiers

- Modifier .gitignore :
  ```bash
  nano .gitignore
  ```

---

## 5. Raspberry Pi (Références et astuces)

- Optimisation Raspberry Pi :
  [Lien vers les astuces](http://www.pihomeserver.fr/2013/06/17/raspberry-pi-home-server-techniques-doptimisation-de-votre-systeme/)

---

## 6. Annexes

### Lien Firebase

- Data :
  [Lien Firebase Data](https://console.firebase.google.com/project/hab-datalog/database/hab-datalog-default-rtdb/data)
- Paramètres :
  [Lien Firebase Settings](https://console.firebase.google.com/u/0/project/hab-datalog/settings/general/web:MjUyMDY2NDYtZGQzYS00ZTBjLTg2NjItZmM3MTgzODIzN2Jl)

### Sources utiles

- [Organisation des dossiers sous Linux](http://www.linux-france.org/article/sys/fichiers/fichiers-2.html)
- [Montage SMB](https://www.linode.com/docs/guides/linux-mount-smb-share/)

