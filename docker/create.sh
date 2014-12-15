#!/bin/bash

sudo docker run -d --name sedgemoor \
     -v `pwd`/fs/var/lib/fuseki/databases/:/var/lib/fuseki/databases/ \
     -v `pwd`/fs/etc/fuseki/:/etc/fuseki/ \
     -v `pwd`/fs/etc/elda/conf.d:/etc/elda/conf.d \
     -v `pwd`/fs/etc/apache2/sites-available:/etc/apache2/sites-available \
     -v `pwd`/fs/var/www/data.sedgemoor.gov.uk/html/lda-assets:/var/www/data.sedgemoor.gov.uk/html/lda-assets \
     -p 80:80 \
     -p 3030:3030 \
     -p 8080:8080 \
     epimorphics/data-server

