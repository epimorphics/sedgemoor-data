#/bin/bash

# Use DCLib to convert a CSV file
DCLIB_VERSION=0.0.6-SNAPSHOT

mkdir -p $1/rdf
for FILEPATH in $1/csv/*.csv
do
  FILE=$(basename $FILEPATH)
  ROOT=${FILE%.csv}  
  echo converting $ROOT
  java -jar lib/dclib-$DCLIB_VERSION-run.jar templates/$ROOT.yaml $1/csv/$ROOT.csv > $1/rdf/$ROOT.ttl
done