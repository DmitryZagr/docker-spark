FROM dmitryzagr/hadoop-base:hadoop3.1.0-java8

MAINTAINER Erika Pauwels <erika.pauwels@tenforce.com>
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

RUN apt-get update \
      && apt-get install -y wget \
      && wget http://apache-mirror.rbc.ru/pub/apache/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz \
      && apt-get --purge remove -y wget \
      && tar -xvzf spark-2.3.1-bin-hadoop2.7.tgz \
      && mv spark-2.3.1-bin-hadoop2.7 spark \
      && rm spark-2.3.1-bin-hadoop2.7.tgz \
      && cd /

ENV SPARK_HOME /spark/

COPY hive-site.xml /spark/conf/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN echo "$LOG_TAG Install miniconda2 related packages" && \
    apt-get -y update && \
    apt-get install -y bzip2 ca-certificates apt-utils wget \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion && \
    echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH

ENTRYPOINT ["entrypoint.sh"]
