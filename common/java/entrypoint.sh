#!/bin/bash

set -e
limit_in_bytes=$(cat /sys/fs/cgroup/memory/memory.limit_in_bytes)

# If not default limit_in_bytes in cgroup
APP_NAME_VALUE=${APP_NAME}
if [[ -z "$KAFKA_ADVERTISED_HOST_NAME$KAFKA_LISTENERS" ]]; then
  APP_NAME_VALUE=$(hostname)
fi

export  JAVA_OPTS="-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/logs/${APP_NAME_VALUE}/OOM.dump \
                   -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps  \
                   -Xloggc:/logs/${APP_NAME_VALUE}/gc.gc $JAVA_OPTS"
if [ "$limit_in_bytes" -ne "9223372036854771712" ]
then
    limit_in_megabytes=$(expr $limit_in_bytes \/ 1048576)
    heap_size=$(expr $limit_in_megabytes - $RESERVED_MEGABYTES)
    export JAVA_OPTS="-Xmx${heap_size}m $JAVA_OPTS"
    echo JAVA_OPTS=$JAVA_OPTS
fi

if [ -f "/etc/ip" ]
then
    HOST_IP=`cat /etc/ip`
    cp /etc/hosts /tmp/hosts
    sed -i '$d' /tmp/hosts
    echo "$HOST_IP  $HOSTNAME" >> /tmp/hosts
    cat /tmp/hosts > /etc/hosts
fi
exec "$@"