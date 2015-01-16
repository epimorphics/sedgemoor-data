#/bin/bash

# Use DCLib to convert a CSV file
DCLIB_VERSION=0.0.6-SNAPSHOT

mkdir -p rdf
for FILEPATH in csv/*.csv
do
  FILE=$(basename $FILEPATH)
  ROOT=${FILE%.csv}  
  echo converting $ROOT
  java -jar lib/dclib-$DCLIB_VERSION-run.jar templates/$ROOT.yaml csv/$ROOT.csv > rdf/$ROOT.ttl
done