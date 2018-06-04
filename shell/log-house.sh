#!/bin/bash

find /root/logs -mtime +7 -name info* | while read line
do
    gzip ${line}

done