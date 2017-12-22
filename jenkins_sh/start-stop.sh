#!/bin/bash


JAVA_HOME=/usr/local/java

function print_log(){
    echo "$@"
    if [ -f "$1" ]; then
       tail -300 $1;
    fi
}


##  $1=APP_NAME
function stop_app(){
    echo "$@"

    APP_ID=`${JAVA_HOME}/bin/jps -l | grep /root/service/$1.jar|awk '{print $1}'`
    echo "................................old progress num...................$APP_ID"
    ## 安全停止服务
    i=1
    while [[ ${APP_ID} && "${i}" -lt 5 ]]
    do
        kill  ${APP_ID}
        echo "........................stop progress num ${i}....................${APP_ID}"
        sleep 1;
        APP_ID=`${JAVA_HOME}/bin/jps -l | grep /root/service/$1.jar|awk '{print $1}'`
        let "i += 1"
    done
    if [ ${APP_ID} ]; then
        echo "............................kill -9...................${APP_ID}"
        kill -9 ${APP_ID}
    fi
}


##  $1=APP_NAME  $2=JAVA_OPTS
function start_app(){
    echo "$@"
    echo ".............................starting service............................."
    JAVA_OPTS=$2
    if [ ! -d "/root/logs/$1" ]; then
        mkdir -p /root/logs/$1;
    fi
    if [[  ! -n "${JAVA_OPTS}" ]]; then
        JAVA_OPTS="-Xms2048M  -Xmx2048M"
    fi
        nohup ${JAVA_HOME}/bin/java  ${JAVA_OPTS}   "-XX:OnOutOfMemoryError=\"${JAVA_HOME}/bin/jstack -F %p > /root/logs/$1/stack.txt\"" -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/root/logs/$1/OOM.dump  -jar  /root/service/$1.jar > /dev/null 2>>error.log &
    sleep 5;
    APP_ID=`${JAVA_HOME}/bin/jps -l | grep $1.jar|awk '{print $1}'`
    if [[ ! ${APP_ID} ]]; then
       echo ".......................start fail........................."
       print_log  /root/logs/$1/info.log
       exit 1
    fi
}

##  $1=CHECK_PORT
function check_web_app(){
    echo "$@"
    a=1
    IS_OK="DOWN"
    echo "..........................checking start.........................."
    while [[ "${a}" -lt 120 ]]
    do
        echo "................................checking..........................${a}..................."
        sleep 1;
        let "a += 1"
        result=`curl --connect-timeout 1 http://localhost:$1/health  2>/dev/null` || continue
        if [ -n "${result}" ];then
            echo "check result:${result}"
            IS_OK=`echo ${result}|sed 's/"//g'|awk -F, '{print $1}'|awk -F: '{print $2}'`
            if [ ${IS_OK} == "UP" ]; then
                echo "................................Service is healthy..................................."
                echo "................................Service start success..................................."
                exit 0
            fi
        fi
    done
    print_log  /root/logs/$1/info.log
    exit 1

}