docker compose pull
docker compose down && docker compose up -d
cat docker/nodered/mylog.txt
// A faire qd les containers sont démarré pour purger les images inutiles
docker image prune
docker logs nodered
docker exec -it nodered /bin/bash

sudo find / -not -path '/sys*' -not -path '/dev*' -not -path '/proc*' -mmin -10 -type f