FROM openjdk:8

MAINTAINER Erika Pauwels <erika.pauwels@tenforce.com>
MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

ENV SPARK_VERSION=2.2.0
ENV HADOOP_VERSION=2.8.1

#COPY bde-spark.css /css/org/apache/spark/ui/static/timeline-view.css

ADD https://raw.githubusercontent.com/guilhem/apt-get-install/master/apt-get-install /usr/bin/
RUN chmod +x /usr/bin/apt-get-install

RUN apt-get update && apt-get install -y curl wget \
      && wget https://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
      && tar -xvzf  spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
      && mv spark-${SPARK_VERSION}-bin-without-hadoop spark \
      && rm  spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
      #&& cd /css \
      #&& jar uf /spark/jars/spark-core_2.11-${SPARK_VERSION}.jar org/apache/spark/ui/static/timeline-view.css \
      && cd /

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz
RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*
    
RUN ln -s /opt/hadoop-${HADOOP_VERSION}/etc/hadoop /etc/hadoop
RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
RUN mkdir /opt/hadoop-${HADOOP_VERSION}/logs

RUN mkdir /hadoop-data

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1

ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

RUN apt-get-install -y python3 python3-setuptools python3-pip

RUN echo "export SPARK_DIST_CLASSPATH=$(hadoop classpath)" » /opt/spark-$SPARK_VERSION/conf/spark-env.sh
# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1
