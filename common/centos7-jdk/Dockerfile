#  安装openjdk

FROM reg.zhongjiaxin.com/library/centos7-tools:latest


#RUN yum clean all
#RUN yum install -y java-1.8.0-openjdk   java-1.8.0-openjdk-devel
#RUN yum clean all
#ENV JAVA_VERSION 1.8.0.131
#ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-3.b12.el7_3.x86_64
#CMD ["java"]


RUN cd /tmp  && curl -L -O -H  "Cookie: oraclelicense=accept-securebackup-cookie" -H "Connection: keep-alive"  -k "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz" \
    && mkdir -p /usr/local/jdk  \
    && tar xf jdk-8u131-linux-x64.tar.gz -C /usr/local/jdk  \
    && rm -f jdk-8u131-linux-x64.tar.gz  \
    && ln -s /usr/local/jdk/jdk* /usr/local/java \
    && echo "export JAVA_HOME=/usr/local/java" >> /etc/profile \
    && echo "export PATH=\${PATH}:\${JAVA_HOME}/bin" >> /etc/profile  \
    && echo "export CLASSPATH=.:\${JAVA_HOME}/lib/dt.jar:\${JAVA_HOME}/lib/tools.jar" >> /etc/profile \
    && source /etc/profile \
    && mkdir -p /root/service/log

ENV JAVA_HOME   /usr/local/java

RUN update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1 && \
	update-alternatives --install "/usr/bin/javaws" "javaws" "${JAVA_HOME}/bin/javaws" 1 && \
	update-alternatives --set java "${JAVA_HOME}/bin/java" && \
	update-alternatives --set javaws "${JAVA_HOME}/bin/javaws"

# docker build . -t centos7:jdk8
