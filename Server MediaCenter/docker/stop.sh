#! /bin/bash

if docker inspect -f '{{.Name}}' $(docker ps -aq) | grep -q "/jacektt"; then 
    docker stop jackett
    docker rm jackett
fi
if docker inspect -f '{{.Name}}' $(docker ps -aq) | grep -q "/radarr"; then 
    docker stop radarr
    docker rm radarr
fi
if docker inspect -f '{{.Name}}' $(docker ps -aq) | grep -q "/prowlarr"; then 
    docker stop prowlarr
    docker rm prowlarr
fi
if docker inspect -f '{{.Name}}' $(docker ps -aq) | grep -q "/qbittorrent"; then 
    docker stop qbittorrent
    docker rm qbittorrent
fi
if docker inspect -f '{{.Name}}' $(docker ps -aq) | grep -q "/vpn"; then 
    docker stop vpn
    docker rm vpn
fi
