#!/bin/bash

# get hostname
if [ -z "$SERVER_NAME" ]; then
    # last resort: just use the IP address
    SERVER_NAME=$(hostname -I | cut -f1 -d' ')
fi
echo "SERVER_NAME=$SERVER_NAME"

# modify nginx.conf
SRC_FILE="/etc/nginx/conf.d/default.template"
DEST_FILE="/etc/nginx/conf.d/default.conf"
SED_LINE1='s!@@DEFAULT_SERVER_NAME@@!'${SERVER_NAME}'!g'
echo $SED_LINE1
# echo $SED_LINE1 > /tmp/SED_LINE1;
cat $SRC_FILE | sed -e "$SED_LINE1" > $DEST_FILE

# DEBUG
echo -n "server name line: "
cat $DEST_FILE | grep server_name


# start nginx
/usr/sbin/nginx
