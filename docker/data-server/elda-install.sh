#!/bin/bash

ELDA_VERSION=1.3.1

cd $WORKDIR
wget http://repository.epimorphics.com/com/epimorphics/lda/elda-common/$ELDA_VERSION/elda-common-$ELDA_VERSION.war
cp elda-common-$ELDA_VERSION.war /var/lib/tomcat7/webapps/elda.war
