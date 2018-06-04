FROM ubuntu:16.04


RUN apt-get update && apt-get install -yqq  curl vim-tiny  build-essential python


RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install nodejs

#   更改时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./tty /src
WORKDIR /src

RUN chmod -v +x  /src/startup.sh  /src/bin/tty.js

RUN  npm i && \
    # Perform extensive cleanup
    apt-get remove -y \
      build-essential \
      python \
    && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{cache,log}/ && \
    rm -rf /var/lib/apt/lists/*.lz4 && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /usr/share/doc/ && \
    rm -rf /usr/share/man/

CMD ["/src/startup.sh"]

EXPOSE 3000


#docker run -it --name="ttyjs" -p "3000:3000" -v /root/logs/app:/home/ubuntu/app:ro  -v /root/logs/service:/home/ubuntu/service:ro --restart="always"  --entrypoint=/bin/bash   dorowu/ubuntu-ssh-ttyjs

#docker run -i -t --entrypoint=/bin/bash -p 3000:3000 dorowu/ubuntu-ssh-ttyjs

#docker run -d --name="ttyjs" -p "3000:3000" \
#    --restart="always" \
#    -v /root/logs/app:/root/app:ro \
#    -v /root/logs/service:/root/service:ro \
#    reg.zhongjiaxin.com/library/ttyjs:latest
