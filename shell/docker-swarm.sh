#!/usr/bin/env bash


docker swarm init --advertise-addr  10.33.80.122
# docker swarm join --token SWMTKN-1-1nf5qomkgdnm8h1n9omkjeo65u8c4dxioir3hed6do2f2232h8-1f1hy5zrrnr595dv7xevimnvn 10.33.80.122:2377

docker node update --label-add name=elk1 elk1 && \
docker node update --label-add name=elk2 elk2 && \
docker node update --label-add name=elk3 elk3

docker stack deploy -c docker-compose.yml elk

docker-machine ssh elk2 echo "vm.max_map_count=262144" >> /etc/sysctl.conf