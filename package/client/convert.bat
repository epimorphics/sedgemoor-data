REM A script to convert CSV data to RDF
echo off

REM  create the directory to hold the RDF data

IF NOT EXIST rdf mkdir rdf

REM run the converter on each csv file

for /r %%f in (csv/*.csv) do (
  echo processing %%f
  java -jar "lib/dclib-0.0.6-SNAPSHOT-run.jar" "templates/%%~nf.yaml" "csv/%%~nf.csv" > "rdf/%%~nf.ttl"
)

echo ==========
echo .
echo    DONE
echo .
echo ==========
