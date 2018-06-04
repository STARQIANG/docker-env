#  安装openjdk

FROM docker.elastic.co/elasticsearch/elasticsearch-platinum:6.1.0
COPY x-pack-6.1.0.jar  /usr/share/elasticsearch/plugins/x-pack/x-pack-6.1.0.jar
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN  chgrp 0 /usr/local/bin/docker-entrypoint.sh && chmod g=u /etc/passwd && chmod 0775 /usr/local/bin/docker-entrypoint.sh



