FROM ubuntu:14.04
MAINTAINER Vladislav Stetsenko <ravenzakmoto@gmail.com>

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install --no-install-recommends -y zookeeper && \
    rm /etc/zookeeper/conf/zoo.cfg && \
    rm /var/lib/zookeeper/myid

EXPOSE 2181 2888 3888
VOLUME ["/var/lib/zookeeper", "/var/log/zookeeper"]

ADD ./conf_script.sh /conf_script.sh
ENTRYPOINT ["/run.sh"]

