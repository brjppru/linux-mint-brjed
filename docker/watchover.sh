#!/bin/sh

docker ps -a --no-trunc  | grep "watchtower" | awk '{print $1}' | xargs docker container stop

docker pull  containrrr/watchtower

echo y | docker system prune --volumes

docker run -d \
    --name watchtower \
    --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower
