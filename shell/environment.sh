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
  --generic-ssh-port=2222  \
  --generic-ip-address=10.0.8.199  \
  --generic-ssh-key ~/.ssh/id_rsa \
   real


docker-machine create  --engine-registry-mirror=https://7os77co8.mirror.aliyuncs.com \
  --driver generic \
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