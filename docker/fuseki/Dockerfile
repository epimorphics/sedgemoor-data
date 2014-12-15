# Version 0.0.1
FROM ubuntu:14.04
MAINTAINER brian@epimorphics.com
ENV FUSEKI_VERSION 1.0.1
ENV WORKDIR /deploy
RUN mkdir $WORKDIR
WORKDIR /deploy
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y wget
RUN apt-get install -y sysv-rc-conf

ENV RESTART_FROM_HERE now
COPY fuseki-install.sh /deploy/fuseki-install.sh
RUN chmod a+x fuseki-install.sh
RUN /deploy/fuseki-install.sh
COPY fuseki-defaults /etc/default/fuseki
COPY fuseki-config.ttl /etc/fuseki/config.ttl
COPY fuseki-log4j.properties /etc/fuseki/log4j.properties

CMD sudo /usr/share/fuseki/fuseki start ; while true ; do sleep 32767 ; done

EXPOSE 3030




