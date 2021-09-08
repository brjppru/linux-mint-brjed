#!/bin/sh

docker ps -a --no-trunc  | grep "smtp" | awk '{print $1}' | xargs docker container stop

docker pull bytemark/smtp

echo y | docker system prune --volumes

docker run -d --restart always --name mail \
    --publish 25:25 \
    -e RELAY_HOST=smtp.example.com \
    -e RELAY_PORT=587 \
    -e RELAY_USERNAME=alice@example.com \
    -e RELAY_PASSWORD=secretpassword \
    -e RELAY_NETS=172.17.0.1/32 \
    -d bytemark/smtp
