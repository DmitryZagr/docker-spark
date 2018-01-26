FROM dmitryzagr/hadoop-base:hadoop3.0.0-java8

MAINTAINER Erika Pauwels <erika.pauwels@tenforce.com>
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

RUN apt-get update \
      && apt-get install -y wget \
      && wget http://apache-mirror.rbc.ru/pub/apache/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz \
      && apt-get --purge remove -y wget \
      && tar -xvzf spark-2.2.1-bin-hadoop2.7.tgz \
      && mv spark-2.2.1-bin-hadoop2.7 spark \
      && rm spark-2.2.1-bin-hadoop2.7.tgz \
      && cd /

ENV SPARK_HOME /spark/

COPY hive-site.xml /spark/conf/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
