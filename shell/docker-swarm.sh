#!/usr/bin/env bash


docker swarm init --advertise-addr  192.168.99.104
# docker swarm join --token SWMTKN-1-1nf5qomkgdnm8h1n9omkjeo65u8c4dxioir3hed6do2f2232h8-1f1hy5zrrnr595dv7xevimnvn 10.33.80.122:2377

docker node update --label-add name=elk1 elk1 && \
docker node update --label-add name=elk2 elk2 && \
docker node update --label-add name=elk3 elk3

docker stack deploy -c docker-compose.yml elk

docker-machine ssh elk2 echo "vm.max_map_count=262144" >> /etc/sysctl.conf

docker-machine ssh elk3 truncate -s 0 /var/lib/docker/containers/*/*-json.log

nohup ./filebeat -e   -c filebeat.yml > /dev/null 2>>error.log &

curl -L http://zhongjiaxin-backup.oss-cn-beijing.aliyuncs.com/filebeat.sh  -o /root/filebeat.sh && chmod +x /root/filebeat.sh && /root/filebeat.sh -E tomcat=/root/logs/*/*.log