#!/bin/sh

# This simple bash script will produce the output files
# and then start a simple nginx web server for the user to 
# see them.

echo "RUNNING ANALYSIS..."
/usr/bin/Rscript /code/run_all.R
service nginx start
cd /code/reports
echo "PREPARING HTML RESULTS..."

# [command] output directory | template directory
/usr/bin/python /code/functions/make_html.py /code/reports /code/templates
IPADDRESS=$(awk 'END{print $1}' /etc/hosts)

# Create a redirect page in html root
cat << EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0;URL='http://$IPADDRESS:9999'" />    
</head>
</html>
EOF

echo "Open browser to $IPADDRESS, and press CTRL+C to stop."
python -m SimpleHTTPServer 9999
