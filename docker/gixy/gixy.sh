#!/bin/sh

# see https://www.digitalocean.com/community/tools/nginx

exit 0

docker run --rm -v `pwd`/nginx.conf:/etc/nginx/conf/nginx.conf yandex/gixy /etc/nginx/conf/nginx.conf

