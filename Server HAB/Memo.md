# Tools
Mise à jour :
```bash
sudo apt update && sudo apt -y upgrade
```
```bash
docker compose pull
```
```bash
docker compose down && docker compose up -d
```
Memoriser la conf de deconz (Attention, fair GIT COMMIT + PUSH après) :
```
cp -f ~/docker.ram/deconz/zll.db ~/docker.ram/deconz/session.default ~/docker.ram/deconz/config.ini ~/docker.ram/deconz/deCONZ.tar.gz ~/docker/deconz
```

Afficher les logs applicatif :
```
cat docker/nodered/mylog.txt
```

Rechercher les fichiers modifiés :
```
sudo find / -not -path '/sys*' -not -path '/dev*' -not -path '/proc*' -not -path '/var/log/*' -not -path '/run/*' -not -path '/home/habadm/docker.ram/*' -mmin -10 -type f
```

# Firebase
Data :
https://console.firebase.google.com/project/hab-datalog/database/hab-datalog-default-rtdb/data  
  
Paramètrage :
https://console.firebase.google.com/u/0/project/hab-datalog/settings/general/web:MjUyMDY2NDYtZGQzYS00ZTBjLTg2NjItZmM3MTgzODIzN2Jl  
