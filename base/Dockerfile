FROM bde2020/hadoop-base:1.2.1-hadoop2.8.1-java8

MAINTAINER Erika Pauwels <erika.pauwels@tenforce.com>
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

RUN apt-get update \
      && apt-get install -y wget \
      && wget https://dl.dropboxusercontent.com/u/4882345/packages/spark-2.1.2-SNAPSHOT-bin-spark-2.1.0-hive.tgz \
      && apt-get --purge remove -y wget \
      && tar -xvzf spark-2.1.2-SNAPSHOT-bin-spark-2.1.0-hive.tgz \
      && mv spark-2.1.2-SNAPSHOT-bin-spark-2.1.0-hive spark \
      && rm spark-2.1.2-SNAPSHOT-bin-spark-2.1.0-hive.tgz \
      && cd /

ENV SPARK_HOME /spark/

COPY hive-site.xml /spark/conf/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
