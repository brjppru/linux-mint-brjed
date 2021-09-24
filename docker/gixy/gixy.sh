#!/bin/sh

exit 0

docker run --rm -v `pwd`/nginx.conf:/etc/nginx/conf/nginx.conf yandex/gixy /etc/nginx/conf/nginx.conf

