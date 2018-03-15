#!/bin/bash

find /root/logs -mtime +7 -name info* | while read line
do
    fileName=${line##*_}
    echo ${fileName}|egrep "([0-9][0-9][0-9][0-9])-(0[1-9]|[1][0-2])-(0[1-9]|[1-2][0-9]|3[0-1])"
    dirMonth=
    if [ $? = 0 ]; then
       echo "ok"
       dirMonth=${fileName%-*}
    else
       continue;
    fi
    distDir="/ossfs"${line%/*}/${dirMonth}
    echo  "${fileName}------${dirMonth}------${distDir}"
    if [ ! -d "${distDir}" ]; then
        mkdir -p ${distDir}
        echo "创建--------${distDir}"
    fi
    tmpLine=${line}"-"${HOSTNAME}
    echo "${tmpLine}"
    mv  ${line}  ${tmpLine}
    gzip ${tmpLine}
    mv ${line}*  ${distDir}/
done