#!/bin/bash -x

docker pull adolfintel/speedtest:latest
docker stop speedtest 
docker rm speedtest

docker run -d --restart unless-stopped \
    -e MODE=standalone \
    --name speedtest \
    -e TELEMETRY=true \
    -e PASSWORD="testmy" \
    -e WEBPORT=86 \
    -p 8686:86 \
    adolfintel/speedtest:latest
