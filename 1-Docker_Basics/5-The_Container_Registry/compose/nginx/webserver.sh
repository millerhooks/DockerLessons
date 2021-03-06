#!/bin/bash
IMAGE="nginx:egghead"

if [[ "$1" = "start" ]]; then
    echo "Running Nginx Container '$IMAGE'"
    docker run -d \
        -p "8888:80" \
        -p "443:443" \
        -v "$PWD/src/html/index.html:/usr/share/nginx/html/index.html" \
        -v "$PWD/src/:/home/src/" \
        -v "$PWD/conf/nginx/default.conf:/etc/nginx/conf.d/default.conf" \
        -v "$PWD/conf/nginx/nginx.conf:/etc/nginx/nginx.conf" \
        $IMAGE

    # Some bash magic, breaks down as follows
    # CONTAINER_NAME=<list running containers> | <get CONTAINER_ID, IMAGE, and NAME> | <return only lines that match $IMAGE> | <return only NAME>

    CONTAINER_NAME=`docker ps | awk '{ print $1,$2,$NF }' | grep $IMAGE | awk '{print $NF }'`
    echo "Started Container '$CONTAINER_NAME.' Execing Container TTY."
    docker exec -it $CONTAINER_NAME /bin/bash
fi

if [[ "$1" = "stop" ]]; then
    echo "Stopping all '$IMAGE' Docker Containers."
    docker ps | awk '{ print $1,$2,$NF }' | grep $IMAGE | awk '{print $NF }' | xargs -I {} docker stop {}
fi

if [[ "$1" = "bash" ]]; then
    CONTAINER_NAME=`docker ps | awk '{ print $1,$2,$NF }' | grep $IMAGE | awk '{print $NF }'`
    echo "Found Container '$CONTAINER_NAME.' Execing Container TTY."
    docker exec -it $CONTAINER_NAME /bin/bash
fi

if [[ "$1" = "build" ]]; then
    echo "Building Docker Image $IMAGE"
    docker build -t $IMAGE .
fi