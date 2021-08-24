#!/bin/sh

docker ps -a --no-trunc  | grep "webdav" | awk '{print $1}' | xargs docker container stop

docker pull bytemark/webdav

echo y | docker system prune --volumes

sudo mkdir -p /var/spool/dav

docker run --restart always -v /var/spool/dav:/var/lib/dav \
    -e AUTH_TYPE=Digest \
    -e USERNAME=zalupa \
    -e PASSWORD=koshachiya \
    --publish 6677:80 \
    --name webdav \
    -e LOCATION=/webdav \
    -d bytemark/webdav
