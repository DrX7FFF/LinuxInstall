# Docker
```
docker compose pull
```
```
docker compose down && docker compose up -d
```
Purger les images inutiles (A faire qd les containers sont démarré) :
```
docker image prune
```
Afficher les logs :
```
docker logs nodered
```

Afficher les logs applicatif :
```
cat docker/nodered/mylog.txt
```

Lancer une commande dans le container :
```
docker exec -it nodered /bin/bash
```

# GIT
```
git status
```
```
git add deconz/session.default deconz/zll.db nodered/context/global/global.json nodered/flows.json nodered/flows_cred.json
```
```
nano .gitignore
```
```
git commit -a -m 'Sauvegarde'
```
```
git push
```
```
git pull
```

# Linux
```
sudo find / -not -path '/sys*' -not -path '/dev*' -not -path '/proc*' -mmin -10 -type f
```

# Lien Firebase
https://console.firebase.google.com/project/hab-datalog/database/hab-datalog-default-rtdb/data
