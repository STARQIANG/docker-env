#!/bin/bash

curl  -XGET  -u elastic:zhongjiaxin.2017 http://10.0.8.113:9200/_cat/indices |awk '{ print $3  }'|while read line
do
    echo $line
done


curl -XGET  -u elastic:zhongjiaxin.2017 http://10.0.8.113:9200/_cat/indices  |grep yellow|awk '{ print $3  }'|while read line
do
    curl  -H 'Content-Type: application/json' -H 'Accept: application/json'  -XPUT -u elastic:zhongjiaxin.2017  http://10.0.8.112:9200/${line}/_settings -d'{
        "index" : {
            "number_of_replicas" : 0
        }
    }'
    sleep 1;
done


curl  -H 'Content-Type: application/json' -H 'Accept: application/json'  -XPUT -u elastic:zhongjiaxin.2017  http://10.0.8.112:9200/tomcat-*/_settings -d'{
    "index" : {
        "number_of_replicas" : 0
    }
}'