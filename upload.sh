#!/bin/bash

for FILEPATH in data/rdf/*
do
  FILE=`basename $FILEPATH`
  echo $FILE
  /usr/share/fuseki/s-put $1 http://data.sedgemoor.gov.uk/graph/cim/data/${FILE%.ttl} $FILEPATH
done
for FILEPATH in data/def/*
do
  FILE=`basename $FILEPATH`
  echo $FILE
  /usr/share/fuseki/s-put $1 http://data.sedgemoor.gov.uk/graph/cim/def/${FILE%.ttl} $FILEPATH
done