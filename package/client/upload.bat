REM A script to convert CSV data to RDF
echo off

REM upload each RDF data file in turn

for /r %%f in (rdf/*) do (
  echo uploading %%~nf
  ruby lib/s-put http://localhost:3030/cim/data http://data.sedgemoor.gov.uk/graph/cim/data/%%~nf rdf/%%~nf%%~xf
)

REM upload each RDF vocabulary file in turn

for /r %%f in (def/*) do (
  echo uploading %%~nf
  ruby lib/s-put http://localhost:3030/cim/data http://data.sedgemoor.gov.uk/graph/cim/def/%%~nf def/%%~nf%%~xf
)

echo ==========
echo .
echo    DONE
echo .
echo ==========
