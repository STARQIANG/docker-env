#!/bin/bash

prospectors=()
index=0
while [ -n "$1" ]
do
        case "$1" in
                -E) prospectors[$index]=${2//\*/NAN};  index=`expr $index + 1`; shift 2;;
                --) break ;;
                *) echo "-E tomcat=/root/logs/*/*.log"; break ;;
        esac
done

len=${#prospectors[@]}
if [[ $len  -lt 1 ]]; then
    echo "请输入参数,如-E tomcat=/root/logs/*/*.log"
    exit;
fi

if [ -d "/var/lib/filebeat" ]; then
     echo -n "删除已经存在的/var/lib/filebeat? yes|no:  "
     read isdel
     if [ "$isdel" != "yes" ];then
        echo "退出安装!!"
        exit;
     fi
    pid=$(ps -ef | grep "/var/lib/filebeat/filebeat" | grep -v grep | awk '{print $2}')
    if [ ${pid} ]; then
      echo "停止filebeat程序"
      kill -9  $pid;
      echo "kill -9  $pid"
    fi
fi
rm -rf /var/lib/filebeat

cd /tmp && \
curl -L -O  "http://zhongjiaxin-backup.oss-cn-beijing.aliyuncs.com/filebeat.tar.gz" && \
tar xf filebeat.tar.gz -C /var/lib/  && \
rm -f filebeat.tar.gz
mkdir -p /root/.filebeat/data
echo  "$@"
for i in ${prospectors[@]}
do
    OLD_IFS="$IFS"
    IFS="="
    arr=($i)
    IFS="$OLD_IFS"
    info=""
    if [ "${arr[0]}" = "tomcat" ];then
info="
-  type: log
   enabled: true
   paths:
     - ${arr[1]//NAN/*}
   multiline.pattern: '^\d{4}\-\d{2}\-\d{2}\s\d+\:\d+\:\d+\,\d+'
   multiline.negate: true
   multiline.match: after
   tags: [\"${arr[0]}\"]"
    else
info="
-  type: log
   enabled: true
   paths:
     - ${arr[1]//NAN/*}
   exclude_files: ['.gz$']
   tags: [\"${arr[0]}\"]"
   fi
echo "${info}";
echo "${info}" >> /var/lib/filebeat/filebeat.yml
done
chown root:root /var/lib/filebeat/filebeat.yml
nohup /var/lib/filebeat/filebeat  -e   -c /var/lib/filebeat/filebeat.yml > /dev/null 2>>error.log &
pid=$(ps -ef | grep "/var/lib/filebeat/filebeat" | grep -v grep | awk '{print $2}')
if [ ${pid} ]; then
  echo "启动成功"
fi
