#!/bin/bash
set -e

APP_NAME=outer-web
JAVA_OPTS="-Xms1024M  -Xmx1024M"
CHECK_PORT=8083
source /root/service/zhongjiaxin_jenkins_sh/start-stop.sh


## 安全停止服务
stop_app ${APP_NAME};

if [[ "$?" -ne "0" ]]; then
    echo ".....................service stop fail................................."
    exit 1
fi

## 启动
start_app ${APP_NAME} "${JAVA_OPTS}";
if [[ "$?" -ne "0" ]]; then
    echo ".....................service start fail................................."
    exit 1
fi


## 检测服务是否正常启动
check_web_app ${CHECK_PORT};
if [[ "$?" -ne "0" ]]; then
    echo ".....................service check fail................................."
    exit 1
fi