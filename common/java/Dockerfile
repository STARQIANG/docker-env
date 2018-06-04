
FROM java:8

MAINTAINER yangzhenwei@zhongjiaxin.com

RUN apt-get update && apt-get install -y  netcat-traditional

ENV RESERVED_MEGABYTES 512

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY entrypoint.sh  /entrypoint.sh
RUN chmod -v +x  /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

RUN   apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{cache,log}/ && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /usr/share/doc/ && \
    rm -rf /usr/share/man/