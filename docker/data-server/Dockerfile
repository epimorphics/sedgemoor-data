# Version 0.0.1
FROM epimorphics/fuseki
MAINTAINER brian@epimorphics.com
ENV WORKDIR /deploy
WORKDIR /deploy
RUN apt-get update
RUN apt-get install -y tomcat7

COPY elda-install.sh /deploy/
RUN chmod a+x /deploy/elda-install.sh
RUN /deploy/elda-install.sh

RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod rewrite
RUN a2enmod expires
RUN a2enmod cache
RUN a2enmod deflate
RUN a2enmod headers
RUN a2enmod cache_disk
RUN a2enmod reqtimeout
RUN for SITE in /etc/apache2/sites-enabled/* ; do a2dissite `basename $SITE` ; done
RUN for SITE in /etc/apache2/sites-available/* ; do a2ensite `basename $SITE` ; done

CMD /usr/share/fuseki/fuseki start ; sudo -u tomcat7 CATALINA_BASE=/var/lib/tomcat7 /usr/share/tomcat7/bin/startup.sh ; service apache2 start ;while true ; do sleep 32767 ; done

EXPOSE 80
EXPOSE 8080




