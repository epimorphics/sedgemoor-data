#!/bin/bash

cd $WORKDIR
useradd --system --no-create-home fuseki
wget http://central.maven.org/maven2/org/apache/jena/jena-fuseki/$FUSEKI_VERSION/jena-fuseki-$FUSEKI_VERSION-distribution.tar.gz


mkdir -p /usr/share/fuseki
mkdir -p /etc/fuseki
mkdir -p /var/log/fuseki
mkdir -p /var/lib/fuseki/databases
mkdir -p /var/lib/fuseki/backups
mkdir -p /var/lib/fuseki/databases/default/tdb
mkdir -p /var/lib/fuseki/databases/default/lucene
chown -R fuseki /var/lib/fuseki/databases
chown -R fuseki /var/log/fuseki
chown -R fuseki /var/lib/fuseki/backups
pushd /usr/share/fuseki
tar -zxf /deploy/jena-fuseki-$FUSEKI_VERSION-distribution.tar.gz --no-same-owner --overwrite
cd jena-fuseki-$FUSEKI_VERSION
mv * ..
cd ..
rmdir "jena-fuseki-$FUSEKI_VERSION"
chmod a+rx s-*

ln -s /var/lib/fuseki/databases      /etc/fuseki/databases  
ln -s /var/lib/fuseki/backups        /etc/fuseki/backups          
ln -s /var/log/fuseki                /etc/fuseki/logs             
ln -s /etc/fuseki/defaults           /etc/fuseki/defaults         

# setup the fuseki1 link structure to link into the fuseki2 structure
ln -s "/etc/fuseki/databases"        "/usr/share/fuseki/databases"        
ln -s "/etc/fuseki/backups"          "/usr/share/fuseki/backups"    
ln -s "/etc/fuseki/logs"             "/usr/share/fuseki/logs"            

# set up the fuseki service
#ln -s /usr/share/fuseki/fuseki /etc/init.d/fuseki
#sysv-rc-conf fuseki on
