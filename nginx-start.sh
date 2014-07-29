#!/bin/bash

# get hostname
if [ -n "$SERVER_NAME" ]; then
    # use HOST_DOMAIN environment variable
    PUBLIC_HOSTNAME=$SERVER_NAME
else
    # last resort: just use the IP address
    PUBLIC_HOSTNAME=$(hostname -I | cut -f1 -d' ')
fi

# modify nginx.conf
SRC_FILE="/etc/nginx/conf.d/default.template"
DEST_FILE="/etc/nginx/conf.d/default.conf"
SED_LINE1='s!@@DEFAULT_SERVER_NAME@@!'${PUBLIC_HOSTNAME}'!g'
echo $SED_LINE1 > /tmp/SED_LINE1;
cat $SRC_FILE | sed -f /tmp/SED_LINE1 > $DEST_FILE

# start nginx
/usr/sbin/nginx
