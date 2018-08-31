#!/usr/bin/env sh

if [ ! -n "$SERVER_PROXY_PASS" ] ; then
    echo "Environment variable SERVER_PROXY_PASS is not set, exiting."
    exit 1
fi

# set server name from optional ENV var
if [ ! -n "$SERVER_NAME" ] ; then
    SERVER_NAME='localhost'
fi

sed -i "s|\${SERVER_PROXY_PASS}|${SERVER_PROXY_PASS}|" /etc/nginx/conf.d/default.conf
sed -i "s|\${SERVER_PROXY_HOST}|${SERVER_PROXY_HOST}|" /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
