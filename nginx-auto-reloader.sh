#!/bin/sh

while true
do
    inotifywait -q -e create,modify,delete,move,attrib /etc/nginx/ /etc/nginx/conf.d
    echo -ne "Detected Nginx Configuration Change. "
    nginx -t &> /dev/null
    if [ $? -eq 0 ]
    then
        echo -ne "Configuration has been reloaded.\n"
        nginx -s reload &> /dev/null
    else
        echo -ne "Configuration syntax failed.\n"
    fi
done
