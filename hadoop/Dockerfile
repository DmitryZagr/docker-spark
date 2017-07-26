FROM ubuntu:16.04

MAINTAINER Mikhail Shimko <mikevictim@gmail.com>

RUN apt-get update \
    &&  apt-get install -y  openjdk-8-jre-headless ca-certificates-java \
    && rm -rf /var/lib/apt/lists/*
    
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

ENV HADOOP_VERSION 2.8.1
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN apt-get update && apt-get install -y curl && apt-get install -y wget \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
   # && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
   # && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV HOST_RESOLVER=files_dns
ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

ADD Entrypoint.sh /Entrypoint.sh
RUN chmod a+x /Entrypoint.sh

ENTRYPOINT ["/Entrypoint.sh"]
