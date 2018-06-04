#!/usr/bin/env bash

systemctl stop firewalld
systemctl disable firewalld
yum install -y iptables-services



#查看iptables现有规则
cp /usr/libexec/iptables/iptables.init /etc/init.d/iptables
iptables -L -n
#先允许所有,不然有可能会杯具
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
#清空所有默认规则
iptables -F
iptables -t nat -F
#清空所有自定义规则
iptables -X
iptables -t nat -X
#所有计数器归0
iptables -Z
iptables -t nat -Z
#允许来自于lo接口的数据包(本地访问)
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -s  10.33.80.0/24   -p tcp  -m multiport --dport 22,2377,2376,5601,2181,9200,9092,7946,4789,9000,8080,80,514  -j ACCEPT
#允许ping
iptables -A INPUT -p icmp --icmp-type 8 -j ACCEPT
iptables -A INPUT -s  10.33.80.0/24  -p udp  -m multiport --dport 7946,4789 -j ACCEPT
#其他入站一律丢弃
iptables -P INPUT DROP
#所有出站一律绿灯
iptables -P OUTPUT ACCEPT
#所有转发一律绿灯（docker）
iptables -P FORWARD ACCEPT
/etc/init.d/iptables save
systemctl restart iptables.service




iptables -A DOCKER -s  10.33.80.0/24  -d  172.17.0.2   -p tcp --dport 80 -j ACCEPT

iptables -A DOCKER -s  10.33.80.0/24   -j ACCEPT
iptables -t nat  -I  PREROUTING 1   ! -s  10.33.80.0/24 -j RETURN

iptables -t nat  -I  PREROUTING  1  ! -s  10.33.80.0/24  -p tcp --dport 81 -j RETURN


iptables -t nat  -I  PREROUTING  1  ! -s  10.33.80.113/32  -p tcp --dport 9092 -j RETURN

iptables -A INPUT ! -s  10.33.80.113/32  -p tcp --dport 9092 -j DROP

iptables -t nat  -I  PREROUTING  1  ! -s  10.33.80.113/32  -p tcp --dport 9092 -j RETURN

firewall-cmd --permanent --direct --passthrough ipv4 -t nat -I  PREROUTING  1  ! -s  10.33.80.113/32  -p tcp --dport 9092 -j RETURN



iptables -A INPUT ! -s  10.33.80.109/32  -p tcp --dport 9092 -j DROP

iptables -t nat  -I  PREROUTING  1  ! -s  10.33.80.109/32  -p tcp --dport 9092 -j DROP