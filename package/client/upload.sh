#!/bin/bash

for FILEPATH in rdf/*
do
  FILE=`basename $FILEPATH`
  echo $FILE
  /usr/share/fuseki/s-put $1 http://data.sedgemoor.gov.uk/graph/data/${FILE%.ttl} $FILEPATH
done
for FILEPATH in def/*
do
  FILE=`basename $FILEPATH`
  echo $FILE
  /usr/share/fuseki/s-put $1 http://data.sedgemoor.gov.uk/graph/def/${FILE%.ttl} $FILEPATH
done