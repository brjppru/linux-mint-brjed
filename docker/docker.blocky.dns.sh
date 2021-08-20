#!/bin/sh

# see https://github.com/0xERR0R/blocky
# https://0xerr0r.github.io/blocky/

docker ps -a --no-trunc  | grep "blocky" | awk '{print $1}' | xargs docker container stop

docker pull spx01/blocky

echo y | docker system prune --volumes

sudo cp blocky.yml /opt/blocky.yml

sudo docker volume create blocky_logs

docker run -d \
    --restart always \
    -v blocky_logs:/logs \
    --name blocky \
    -v /opt/blocky.yml:/app/config.yml \
    -p 4000:4000 -p 53:53/udp \
    spx01/blocky

