#!/bin/sh

# This simple bash script will produce the output files
# and then start a simple nginx web server for the user to 
# see them.

echo "RUNNING ANALYSIS..."
/usr/bin/Rscript /code/run_all.R
service nginx start
cd /code/reports
echo "PREPARING HTML RESULTS..."
/usr/bin/python /code/functions/make_html.py /code/reports
IPADDRESS=$(awk 'END{print $1}' /etc/hosts)
echo "Open browser to $IPADDRESS:9999"
/usr/bin/python -m  SimpleHTTPServer 9999
