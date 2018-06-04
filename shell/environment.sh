#!/usr/bin/env bash

yum install -y  vim tar wget curl  bzip2  tcpdump less telnet net-tools lsof sysstat  git tcl tcl-devel expect zip unzip \
&& yum clean all

###  研发环境
cd /tmp && \
curl -L -O -H  "Cookie: oraclelicense=accept-securebackup-cookie" -H "Connection: keep-alive"  -k "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz" && \
mkdir -p /usr/local/jdk && \
tar xf jdk-8u131-linux-x64.tar.gz -C /usr/local/jdk && \
rm -f jdk-8u131-linux-x64.tar.gz && \
ln -s /usr/local/jdk/jdk* /usr/local/java && \
echo "export JAVA_HOME=/usr/local/java" >> /etc/profile && \
echo "export PATH=\${PATH}:\${JAVA_HOME}/bin" >> /etc/profile && \
echo "export CLASSPATH=.:\${JAVA_HOME}/lib/dt.jar:\${JAVA_HOME}/lib/tools.jar" >> /etc/profile  && \
source /etc/profile



docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ip-address=10.33.80.116  \
  --generic-ssh-key ~/.ssh/id_rsa \
   test1

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ip-address=10.33.80.113  \
  --generic-ssh-key ~/.ssh/id_rsa \
   test2

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ip-address=10.33.80.109  \
  --generic-ssh-key ~/.ssh/id_rsa \
   test3

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.33.80.108  \
  --generic-ssh-key ~/.ssh/id_rsa \
   test4

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.33.80.129  \
  --generic-ssh-key ~/.ssh/id_rsa \
   GR-test

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=2222  \
  --generic-ip-address=10.0.8.199  \
  --generic-ssh-key ~/.ssh/id_rsa \
   real

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.0.8.189  \
  --generic-ssh-key ~/.ssh/id_rsa \
   real2

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --engine-storage-driver devicemapper \
  --engine-opt "storage-opt dm.directlvm_device=/dev/xdf" \
  --engine-opt "storage-opt dm.thinp_percent=95" \
  --engine-opt "storage-opt dm.thinp_metapercent=1" \
  --engine-opt "storage-opt dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt dm.directlvm_device_force=false" \
  --generic-ssh-port=22  \
  --generic-ip-address=10.33.80.115  \
  --generic-ssh-key ~/.ssh/id_rsa \
   jenkins-dev


docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=2222  \
  --generic-ip-address=10.0.8.187  \
  --generic-ssh-key ~/.ssh/id_rsa \
   online

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.33.80.119  \
  --generic-ssh-key ~/.ssh/id_rsa \
   dev1

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.33.80.120  \
  --generic-ssh-key ~/.ssh/id_rsa \
   dev2

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.33.80.108  \
  --generic-ssh-key ~/.ssh/id_rsa \
   dev4

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.33.80.103  \
  --generic-ssh-key ~/.ssh/id_rsa \
   dev3

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ip-address=10.33.80.122  \
  --generic-ssh-key ~/.ssh/id_rsa \
   elk1

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ip-address=10.33.80.123	\
  --generic-ssh-key ~/.ssh/id_rsa \
   elk2

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ip-address=10.33.80.124  \
  --generic-ssh-key ~/.ssh/id_rsa \
   elk3


docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=2222  \
  --generic-ip-address=10.0.8.112  \
  --generic-ssh-key ~/.ssh/id_rsa \
  --engine-opt "storage-opt=dm.directlvm_device=/dev/sdd" \
  --engine-opt "storage-opt=dm.thinp_percent=95" \
  --engine-opt "storage-opt=dm.thinp_metapercent=1" \
  --engine-opt "storage-opt=dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt=dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt=dm.directlvm_device_force=false" \
   elk1-prod


docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=2222  \
  --generic-ip-address=10.0.8.113  \
  --generic-ssh-key ~/.ssh/id_rsa \
  --engine-storage-driver devicemapper \
  --engine-opt "storage-opt=dm.directlvm_device=/dev/sdd" \
  --engine-opt "storage-opt=dm.thinp_percent=95" \
  --engine-opt "storage-opt=dm.thinp_metapercent=1" \
  --engine-opt "storage-opt=dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt=dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt=dm.directlvm_device_force=false" \
   elk2-prod

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=2222  \
  --generic-ip-address=10.0.8.114  \
  --generic-ssh-key ~/.ssh/id_rsa \
  --engine-storage-driver devicemapper \
  --engine-opt "storage-opt=dm.directlvm_device=/dev/sdd" \
  --engine-opt "storage-opt=dm.thinp_percent=95" \
  --engine-opt "storage-opt=dm.thinp_metapercent=1" \
  --engine-opt "storage-opt=dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt=dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt=dm.directlvm_device_force=false" \
   elk3-prod



docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --engine
  --driver generic \
  --generic-ip-address=10.0.8.117  \
  --generic-ssh-key ~/.ssh/id_rsa \
   db-cluster1

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.0.8.117  \
  --generic-ssh-key ~/.ssh/id_rsa \
  --engine-storage-driver devicemapper \
  --engine-opt "storage-opt=dm.directlvm_device=/dev/sdc" \
  --engine-opt "storage-opt=dm.thinp_percent=95" \
  --engine-opt "storage-opt=dm.thinp_metapercent=1" \
  --engine-opt "storage-opt=dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt=dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt=dm.directlvm_device_force=false" \
   db-cluster1

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ip-address=10.0.8.116  \
  --generic-ssh-key ~/.ssh/id_rsa \
   db-cluster2

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.0.8.116  \
  --generic-ssh-key ~/.ssh/id_rsa \
  --engine-storage-driver devicemapper \
  --engine-opt "storage-opt=dm.directlvm_device=/dev/sdc" \
  --engine-opt "storage-opt=dm.thinp_percent=95" \
  --engine-opt "storage-opt=dm.thinp_metapercent=1" \
  --engine-opt "storage-opt=dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt=dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt=dm.directlvm_device_force=false" \
   db-cluster2


docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ip-address=10.0.8.115  \
  --generic-ssh-key ~/.ssh/id_rsa \
   db-cluster3


docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.0.8.115  \
  --generic-ssh-key ~/.ssh/id_rsa \
  --engine-storage-driver devicemapper \
  --engine-opt "storage-opt=dm.directlvm_device=/dev/sdc" \
  --engine-opt "storage-opt=dm.thinp_percent=95" \
  --engine-opt "storage-opt=dm.thinp_metapercent=1" \
  --engine-opt "storage-opt=dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt=dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt=dm.directlvm_device_force=false" \
   db-cluster3


docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ip-address=10.0.8.118  \
  --generic-ssh-key ~/.ssh/id_rsa \
   prod1

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ip-address=10.0.8.119  \
  --generic-ssh-key ~/.ssh/id_rsa \
   prod2

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.0.8.122  \
  --generic-ssh-key ~/.ssh/id_rsa \
  --engine-storage-driver devicemapper \
  --engine-opt "storage-opt=dm.directlvm_device=/dev/sdc" \
  --engine-opt "storage-opt=dm.thinp_percent=95" \
  --engine-opt "storage-opt=dm.thinp_metapercent=1" \
  --engine-opt "storage-opt=dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt=dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt=dm.directlvm_device_force=false" \
   log


docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.0.8.176  \
  --generic-ssh-key ~/.ssh/id_rsa \
  --engine-storage-driver devicemapper \
  --engine-opt "storage-opt=dm.directlvm_device=/dev/sdc" \
  --engine-opt "storage-opt=dm.thinp_percent=95" \
  --engine-opt "storage-opt=dm.thinp_metapercent=1" \
  --engine-opt "storage-opt=dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt=dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt=dm.directlvm_device_force=false" \
   elk4-prod

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.0.8.177  \
  --generic-ssh-key ~/.ssh/id_rsa \
  --engine-storage-driver devicemapper \
  --engine-opt "storage-opt=dm.directlvm_device=/dev/sdc" \
  --engine-opt "storage-opt=dm.thinp_percent=95" \
  --engine-opt "storage-opt=dm.thinp_metapercent=1" \
  --engine-opt "storage-opt=dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt=dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt=dm.directlvm_device_force=false" \
   elk5-prod

docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
  --generic-ssh-port=22  \
  --generic-ip-address=10.0.8.178  \
  --generic-ssh-key ~/.ssh/id_rsa \
  --engine-storage-driver devicemapper \
  --engine-opt "storage-opt=dm.directlvm_device=/dev/sdc" \
  --engine-opt "storage-opt=dm.thinp_percent=95" \
  --engine-opt "storage-opt=dm.thinp_metapercent=1" \
  --engine-opt "storage-opt=dm.thinp_autoextend_threshold=80" \
  --engine-opt "storage-opt=dm.thinp_autoextend_percent=20" \
  --engine-opt "storage-opt=dm.directlvm_device_force=false" \
   elk6-prod


############### elk #########################
sysctl -w vm.max_map_count=262144
echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
vim /etc/security/limits.conf
docker swarm join --token SWMTKN-1-2eejnrmu672ra0ajwxuu6jywam5w1aauk1x03vu30bx5voydv2-f3wwmezj09k3b4xh2t7fc9hvs 10.0.8.112:2377

docker node update --label-add logstash=logstash elk2-prod && \
docker node update --label-add logstash=logstash elk3-prod
docker node update --label-add elasticsearch=elasticsearch elk1-prod && \
docker node update --label-add elasticsearch=elasticsearch elk2-prod && \
docker node update --label-add elasticsearch=elasticsearch elk3-prod

docker-machine ssh elk3-prod firewall-cmd --permanent --zone=public --add-port=7946/tcp  --add-port=7946/udp  --add-port=4789/udp  --add-port=2377/udp  --permanent  && firewall-cmd --reload


docker-machine ssh elk1-prod firewall-cmd --permanent --zone=public --add-port=4789/tcp  --permanent  && firewall-cmd --reload && \
docker-machine ssh elk1-prod firewall-cmd --permanent --zone=public --add-port=4098/tcp  --permanent  && firewall-cmd --reload

firewall-cmd --permanent --zone=public --add-port=9600/tcp  --permanent  && firewall-cmd --reload
firewall-cmd --permanent --zone=public --add-port=5061/tcp  --permanent  && firewall-cmd --reload
firewall-cmd --permanent --zone=public --add-port=2377/tcp  --permanent  && firewall-cmd --reload
############### elk #########################
## 批量替换jenkins 文件
sed -i "s/<execTimeout>120000<\/execTimeout>/<execTimeout>300000<\/execTimeout>/g" `grep  \<execTimeout\>120000\<\/execTimeout\>  -rl jobs/*/*.xml`

docker swarm join --token SWMTKN-1-25m605xo0rxkamhgbm7myq9chwnpn36jpt557knyaw8fdpcf9d-5icoppcsl702qhbg9e5lxwd53 10.0.8.117:2377

#关闭“You have new mail in /var/spool/mail/root”提示
echo "unset MAILCHECK" >> /etc/profile && source /etc/profile


firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="10.0.8.0/24"  accept"  &&  \
firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="10.33.80.0/24"  accept"  && \
firewall-cmd --reload
firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="10.33.50.0/24"  accept"  && firewall-cmd --reload

sudo yum-config-manager \
    --add-repo \
    https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

## 解决重启网卡后容器不能访问的问题
## WARNING: bridge-nf-call-iptables is disabled解决
vi /etc/sysctl.conf
net.ipv4.ip_forward=1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-arptables = 1
sysctl -p



docker network create \
  --driver=overlay \
  --subnet=192.168.10.0/24 \
  --attachable \
  esnet

docker run -it --rm  -v /logs/kafka-log  \
    --label aliyun.logs.catalina=stdout  \
    --label aliyun.logs.access=/logs/kafka-log/*.log  \
    --label aliyun.logs.access.format=regexp  \
    --label aliyun.logs.access.format.pattern=^\d{4}\-\d{2}\-\d{2}\s\d+\:\d+\:\d+\,\d+ \
    reg.zhongjiaxin.com/library/dev-kafka-log