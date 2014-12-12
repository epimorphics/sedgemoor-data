#/bin/bash

# Use DCLib to convert a CSV file
DCLIB_VERSION=0.0.5
TEMPFILE=`mktemp`
cat data/csv/$1.csv > $TEMPFILE
echo $TEMPFILE
cat $TEMPFILE
echo ===============================================
java -jar lib/dclib-$DCLIB_VERSION-run.jar --debug templates/$1.json data/csv/$1.csv
rm $TEMPFILE