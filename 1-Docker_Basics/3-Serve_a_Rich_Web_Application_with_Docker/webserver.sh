#!/bin/bash
if [[ "$1" = "start" ]]; then
    echo "Running Nginx Webserver"
    docker run -d \
        -p 8888:80 \
        -v "$PWD/src:/usr/share/nginx/html/" \
        -v "$PWD/conf/nginx/default.conf:/etc/nginx/conf.d/default.conf" \
        -v "$PWD/conf/nginx/nginx.conf:/etc/nginx/nginx.conf" \
        nginx

    # Some bash magic, breaks down as follows
    # CONTAINER_NAME=<list running containers> | <get CONTAINER_ID, IMAGE, and NAME> | <return only lines that match nginx> | <return only NAME>

    CONTAINER_NAME=`docker ps | awk '{ print $1,$2,$NF }' | grep nginx | awk '{print $NF }'`
    echo "Started Container '$CONTAINER_NAME.' Execing Container TTY."
    docker exec -it $CONTAINER_NAME /bin/bash
fi

if [[ "$1" = "stop" ]]; then
    echo "Stopping all 'nginx' Docker Containers."
    docker ps | awk '{ print $1,$2,$NF }' | grep nginx | awk '{print $NF }' | xargs -I {} docker stop {}
fi

if [[ "$1" = "bash" ]]; then
    CONTAINER_NAME=`docker ps | awk '{ print $1,$2,$NF }' | grep nginx | awk '{print $NF }'`
    echo "Found Container '$CONTAINER_NAME.' Execing Container TTY."
    docker exec -it $CONTAINER_NAME /bin/bash
fi